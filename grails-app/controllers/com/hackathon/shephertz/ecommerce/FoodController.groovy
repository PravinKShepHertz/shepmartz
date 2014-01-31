package com.hackathon.shephertz.ecommerce
import com.shephertz.app42.paas.sdk.java.shopping.Catalogue
import com.shephertz.app42.paas.sdk.java.shopping.CatalogueService
import com.shephertz.app42.paas.sdk.java.shopping.ItemData
import com.shephertz.app42.paas.sdk.java.storage.StorageService
import com.shephertz.app42.paas.sdk.java.ServiceAPI
import com.shephertz.app42.paas.sdk.java.upload.UploadFileType
import com.shephertz.app42.paas.sdk.java.upload.Upload
import com.shephertz.app42.paas.sdk.java.upload.UploadService
import com.shephertz.app42.paas.sdk.java.App42Exception
import com.shephertz.app42.paas.sdk.java.App42NotFoundException
import org.json.JSONObject

class FoodController {
 
    def baseURL = grailsApplication.config.baseURL
    def url = grailsApplication.config.url
    def uploadDir = grailsApplication.config.uploadDir
    ServiceAPI api = new ServiceAPI("b6f1119644d65c8787ac1dcccfa53e679f2dff692ad8ea926998884a10101754","39a1d4f3b7dd729af8c8a47d92a4147530deffb0f0d231081c2d0d6aa0d3a6d5")
    CatalogueService catalogue = api.buildCatalogueService()
    StorageService storage = api.buildStorageService()
    
    def index = { 
    
         def result = catalogue.getItemsByCategory("food", "food") 
         println"RESULT---inamge---${result}"
         [itemList: result]
    
    }
    
    
}
