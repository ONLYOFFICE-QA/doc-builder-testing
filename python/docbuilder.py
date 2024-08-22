from typing import Any
import sys


class PythonDocBuilderWrapper:

    def __init__(self, builder_path: str = None) -> None:
        self.builder_path = builder_path if builder_path else self.default_builder_path

    @property
    def default_builder_path(self) -> str:
        return (
            r'C:\Program Files\ONLYOFFICE\DocumentBuilder' if 'win' in sys.platform
            else '/opt/onlyoffice/documentbuilder'
        )

    def builder(self) -> Any:
        sys.path.append(self.builder_path)
        import docbuilder
        return docbuilder.CDocBuilder()


builder = PythonDocBuilderWrapper().builder()
