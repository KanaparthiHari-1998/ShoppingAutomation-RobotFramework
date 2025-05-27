from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn

@library
class ShopItems:
    
    def __init__(self):
        pass

    @keyword
    def add_items_to_cart(self, reqProducts):
        
        self.SelLib = BuiltIn().get_library_instance("SeleniumLibrary")
        shop_data_locator = "css:.card-title"
        # @{web_elements}    Get WebElements    ${shop_items}
        products = self.SelLib.get_webelements(shop_data_locator)
        index = 1
        for product in products:

            if product.text in reqProducts:
                print(product.text)
                print(reqProducts)
                print(index)
                # Click Button    xpath://a[text()='${required_item}']/ancestor::div[contains(@class, 'card')]//button[contains(@class, 'btn-info')]
                self.SelLib.click_button("xpath:(//*[@class='card-footer'])["+str(index)+"]/button")
            index = index + 1
            # time.sleep(5)
        checkoutData = self.SelLib.get_webelement("css:.nav-link.btn.btn-primary").text
        print(checkoutData)

