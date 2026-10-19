"""Reject a native runtime module selection that cannot run the published JAR."""
import argparse
import subprocess
import sys


def check(jar, modules):
    version = subprocess.run(
        ["java", "-XshowSettings:properties", "-version"],
        check=True, capture_output=True, text=True,
    )
    release = next(line.split("=", 1)[1].strip() for line in version.stderr.splitlines()
                   if "java.specification.version =" in line)
    dependencies = subprocess.run(
        ["jdeps", "--multi-release", release, "--print-module-deps", str(jar)],
        check=True, capture_output=True, text=True,
    )
    required = set(dependencies.stdout.strip().split(","))
    runtime = subprocess.run(
        ["java", "--limit-modules", modules, "--list-modules"],
        check=True, capture_output=True, text=True,
    )
    available = {line.split("@", 1)[0] for line in runtime.stdout.splitlines()}
    missing = required - available
    if missing:
        raise ValueError("Bundled runtime is missing modules: " + ", ".join(sorted(missing)))
    print("Runtime modules verified: " + ", ".join(sorted(required)))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("jar")
    parser.add_argument("modules")
    args = parser.parse_args()
    try:
        check(args.jar, args.modules)
    except (ValueError, subprocess.CalledProcessError) as error:
        print(str(error), file=sys.stderr)
        if isinstance(error, subprocess.CalledProcessError):
            print(error.stderr, file=sys.stderr)
        sys.exit(1)
