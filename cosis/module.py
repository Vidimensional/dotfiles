import os
import re
import subprocess

__metaclass__ = type


class ProcRunner:
    def run(self, cmd: list[str]) -> dict[str, str]:
        res = subprocess.run(cmd, capture_output=True)
        res.check_returncode()

        return {
            "stdout": res.stdout.decode("utf-8").strip(),
        }


class TFenvWrapper:
    def __init__(self, proc_runner):
        self.proc_runner = proc_runner
        self.re = re.compile(r"[0-9]+\.[0-9]+\.[0-9]+(-\w+)?")

    def get_versions(self, cmd) -> list[str]:
        res = self.proc_runner.run(cmd)

        versions = []
        for item in res["stdout"].split("\n"):
            found = self.re.search(item)
            if found:
                versions.append(found.group(0))

        return versions

    def get_installed_versions(self) -> list[str]:
        return self.get_versions(["tfenv", "list"])

    def get_remote_versions(self) -> list[str]:
        return self.get_versions(["tfenv", "list-remote"])

    def get_current_version(self) -> str:
        res = self.proc_runner.run(["tfenv", "version-name"])
        return res["stdout"]

    def install_version(self, version: str) -> None:
        self.proc_runner.run(["tfenv", "install", version])


if __name__ == "__main__":
    tf_env = TFenvWrapper(ProcRunner())

    version_to_install = "1.15.1"
    versions = tf_env.get_installed_versions()

    if version_to_install in versions:
        print(f"Version '{version_to_install}' already installed")
        exit(0)
    try:
        tf_env.install_version(version_to_install)
    except subprocess.CalledProcessError as e:
        from pprint import pprint

        # pprint(dir(e))
        pprint(str(e))
