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

class SearchController {

    def baseURL = grailsApplication.config.baseURL
    def url = grailsApplication.config.url
    def uploadDir = grailsApplication.config.uploadDir
    ServiceAPI api = new ServiceAPI("b6f1119644d65c8787ac1dcccfa53e679f2dff692ad8ea926998884a10101754","39a1d4f3b7dd729af8c8a47d92a4147530deffb0f0d231081c2d0d6aa0d3a6d5")
    CatalogueService catalogue = api.buildCatalogueService()
    StorageService storage = api.buildStorageService()
    
    def index = { 
    
        def list = new ArrayList()
        
        Catalogue cat = catalogue.getItems("shepmart")
        
        cat.getCategoryList().each{
            list.add(it.getName())
        }
        list.add("food")
       
        [list: list]
    }
    
    def advanceSearch = {
        
        
    }
    
    def searchResult = {
        
        println"PARAMS---${params}"
        def array = getList()
        println"LIST---${array}"
       
        //                ilike("catName","%"+params.search+"%")
        if(array.contains("${params.search}") == true){
            for(int i=0; i< array.size(); i++)
            {
                println""
            
            }
        }

        
    }
    
    private ArrayList getList(){
        
        def array = new ArrayList()
        Catalogue cat = catalogue.getItems("shepmart")
        Catalogue cat1 = catalogue.getItems("food")
        
        cat.getCategoryList().each{category->
            category.getItemList().each{
                def table = new Hashtable()
                table.put("${category.getName()}",category.getName())
                table.put("itemName",it.getName())
                table.put("itemUrl",it.getUrl())
                table.put("price",it.getPrice())
                table.put("itemId",it.getItemId())
                array.add(table)
            }
        }
        
        cat1.getCategoryList().each{category1->
            category1.getItemList().each{
                def table = new Hashtable()
                table.put("catName",category1.getName())
                table.put("itemName",it.getName())
                table.put("itemUrl",it.getUrl())
                table.put("price",it.getPrice())
                table.put("itemId",it.getItemId())
                array.add(table)
            }
        }
        return array
    }
}
