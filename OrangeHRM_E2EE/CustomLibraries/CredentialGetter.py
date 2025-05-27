from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn

@library
class CredentialGetter:

    def __init__(self):
        pass

    @keyword
    def get_credentials_from_login_page(self, dataLocator):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")
        loginCredentialsItems = self.selLib.get_text(dataLocator)
        splitParts = loginCredentialsItems.split(":")
        loginCredential = splitParts[-1].strip()
        print(loginCredential)
        return loginCredential
    
