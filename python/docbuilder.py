import sys
from typing import Any
from platform import system


class PythonDocBuilderWrapper:

    def __init__(self, builder_path: str = None) -> None:
        self.builder_path = builder_path or self.default_builder_path

    @property
    def default_builder_path(self) -> str:
        if system().lower() == 'windows':
            return r'C:\Program Files\ONLYOFFICE\DocumentBuilder'
        return '/opt/onlyoffice/documentbuilder'

    def builder(self) -> Any:
        sys.path.append(self.builder_path)
        import docbuilder
        return docbuilder.CDocBuilder()


builder = PythonDocBuilderWrapper().builder()
