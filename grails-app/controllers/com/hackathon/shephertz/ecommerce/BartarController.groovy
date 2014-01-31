package com.hackathon.shephertz.ecommerce
import com.shephertz.app42.paas.sdk.java.shopping.Catalogue
import com.shephertz.app42.paas.sdk.java.shopping.CatalogueService
import com.shephertz.app42.paas.sdk.java.shopping.ItemData
import com.shephertz.app42.paas.sdk.java.storage.StorageService
import com.shephertz.app42.paas.sdk.java.shopping.CartService
import com.shephertz.app42.paas.sdk.java.shopping.Cart
import com.shephertz.app42.paas.sdk.java.ServiceAPI
import com.shephertz.app42.paas.sdk.java.upload.UploadFileType
import com.shephertz.app42.paas.sdk.java.upload.Upload
import com.shephertz.app42.paas.sdk.java.upload.UploadService
import com.shephertz.app42.paas.sdk.java.App42Exception
import com.shephertz.app42.paas.sdk.java.App42NotFoundException
import org.json.JSONObject

class BartarController {

    def baseURL = grailsApplication.config.baseURL
    ServiceAPI api = new ServiceAPI("b6f1119644d65c8787ac1dcccfa53e679f2dff692ad8ea926998884a10101754","39a1d4f3b7dd729af8c8a47d92a4147530deffb0f0d231081c2d0d6aa0d3a6d5")
    CatalogueService catalogue = api.buildCatalogueService()
    StorageService storage = api.buildStorageService()
    CartService cartService = api.buildCartService()
    UploadService uploadService = api.buildUploadService()
    
    def index = { 
    
        def list = new ArrayList()
        try{
            def checkStorage = storage.findAllDocuments("shepmart", "shepmart")
            list = checkStorage.getJsonDocList()
            def arr = new ArrayList()
            list.each{li->
                def obj = new JSONObject(li.getJsonDoc()).get("categoryName ").toString()
                arr.add(obj)
            }
            if(params.categoryName){
                flash.message = "Please upload Image file"
            }
            [categoryList: arr]
            
        }
        catch(App42Exception e){
            println"EXCEPTION---${e}"
            redirect(action: "index")
        }
    }
    
    def saveItem = {
        
        def catName = params.categoryName
        def buyCatName = params.buyCategoryName
        def desc = params.itemDesc
        def buyDesc = params.buyItemDesc
        def buyItemName = params.buyItemName
        def itemName = params.itemDesc
        def file = params.file 
        def date = new Date()
        def json = null  
        def uploadInstance = null
        try{
            def ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1, file.getOriginalFilename().size())
            def name = file.getOriginalFilename().substring(0,file.getOriginalFilename().indexOf(".")) + new Date().getTime()
            def fileName = name + ".${ext}"
            uploadInstance = uploadService.uploadFile("${fileName}",file.getInputStream() ,UploadFileType.IMAGE, "image desc")
            println"upload Instance"+uploadInstance
            def url = uploadInstance.getFileList()[0].getUrl()
            json = "{\"categoryName \":\'"+catName+"', \"description \":\'"+desc+"', \"itemName \":\'"+itemName+"', \"buyCategoryName \":\'"+buyCatName+"', \"buyItemName \":\'"+buyItemName+"', \"buyDesc \":\'"+buyDesc+"', \"image \":\'"+url+"', \"date \":\'"+date+"'}"
            def result = storage.insertJSONDocument("bartar", "bartar", json)
            redirect(action: "show")
        }
        catch(App42Exception e){
            if(e.getAppErrorCode() == 2105){
                redirect(action: "index", params:params)
            }
            if(e.getAppErrorCode() == 2100){
                redirect(action: "index", params:params)
            }
        }
        println"CATNAME-__${catName}"
       
    }
    
    def create = {
        
    }
    
    def show = {
        
        try{
            def checkStorage = storage.findAllDocuments("bartar", "bartar")
            println "STORAGE"+checkStorage
            ArrayList list = checkStorage.getJsonDocList()
            def arr = new ArrayList()
            list.each{li->
                def table = new Hashtable()
                
                table.put("catName", new JSONObject(li.getJsonDoc()).get("categoryName ").toString())
                table.put("buyCatName", new JSONObject(li.getJsonDoc()).get("buyCategoryName ").toString())
                table.put("desc", new JSONObject(li.getJsonDoc()).get("description ").toString())
                table.put("buyDesc", new JSONObject(li.getJsonDoc()).get("buyDesc ").toString())
                table.put("buyItemName", new JSONObject(li.getJsonDoc()).get("buyItemName ").toString())
                table.put("itemName", new JSONObject(li.getJsonDoc()).get("itemName ").toString())
                table.put("image", new JSONObject(li.getJsonDoc()).get("image ").toString())
                table.put("date", new JSONObject(li.getJsonDoc()).get("date ").toString())
                arr.add(table)
            }
            println"ARRAY---${arr}"
            [list: arr]
        }
        catch(App42Exception e){
            println e
        }
    }
        
}
