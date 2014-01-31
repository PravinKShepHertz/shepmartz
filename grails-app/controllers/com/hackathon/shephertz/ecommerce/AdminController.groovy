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

class AdminController {

    def apiService
    def uploadApp42Service
     
    def baseURL = grailsApplication.config.baseURL
    def url = grailsApplication.config.url
    def uploadDir = grailsApplication.config.uploadDir
    ServiceAPI api = new ServiceAPI("b6f1119644d65c8787ac1dcccfa53e679f2dff692ad8ea926998884a10101754","39a1d4f3b7dd729af8c8a47d92a4147530deffb0f0d231081c2d0d6aa0d3a6d5")
    CatalogueService catalogue = api.buildCatalogueService()
    StorageService storage = api.buildStorageService()
    
    def index = {
    
    }
    
    def addCatalogue  = {
        
        def result = catalogue.createCatalogue("shepmart", "shepmart") 
        println"RESPONSE--${result.isResponseSuccess()}"
        if(result.isResponseSuccess() == true){
            render "true"
        }
        else{
            render "false"
        }
        //   if(result.getResponse())
    }
    
    def saveItem = {
        
        println"---${params}"
        
        ItemData itemData = new ItemData();   
        itemData.setDescription(params.itemDesc);  
        if(params.file.getSize() != 0){
            def ext = params.file.getOriginalFilename().substring(params.file.getOriginalFilename().lastIndexOf(".")+1,params.file.getOriginalFilename().size())
            def newFile = "${params.itemName.trim()}" + ".${ext}"
            println"NEW FILE---${newFile}"
            new File(uploadDir + "/" + "shepmartz" + "/" + params.itemName.trim()).mkdirs()
            params.file.transferTo(
                new File(uploadDir + "/" +  "shepmartz" + "/" + params.itemName.trim() + "/" + newFile)
            )    
            println"----${baseURL}/web-app/${params.file.getOriginalFilename()}" 
            println"----${params.file.getOriginalFilename()}" 
            itemData.setImage("${uploadDir}/shepmartz/${params.itemName.trim()}/${newFile}");  
        }
        Double price = new Double(params.price)
        itemData.setItemId("${params.itemId}");  
        itemData.setName("${params.itemName.trim()}");  
        itemData.setPrice(price);   
        println"item data--${itemData}---${params.categoryName}"
        try{
            def result = catalogue.addItem("shepmart", "${params.categoryName}", itemData) 
            if(result.isResponseSuccess() == true){
                println"RESULT---inamge---${result}"
                redirect(action: "show")
            }
        }
        catch(App42Exception e){
            redirect(action: "index", params: params)
        }
        
    }
    
    def show = {
        
        try{
            Catalogue result = catalogue.getItems("shepmart")
            // check if response is true
            if(result.isResponseSuccess() == true){
                println"RESULT---${result}"
                [catalogueList: result]
            }
        }
        catch(App42Exception e){
            println"FAILURE"
        }
    }
    
    def item = {
        
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
              flash.message = "Item Id already exists"
           }
            [categoryList: arr]
        }
        catch(App42Exception e){
            println"EXCEPTION---${e}"
            redirect(action: "index")
        }
        
    }
    
    def save = {
        
        def catName = params.categoryName
        def desc = params.catDescription
        println"CATNAME-__${catName}"
        def json = "{\"categoryName \":\'"+catName+"', \"description \":\'"+desc+"'}"
        try{
            def checkStorage = storage.findAllDocuments("shepmart", "shepmart")
            ArrayList list = checkStorage.getJsonDocList()
            def arr = new ArrayList()
            list.each{li->
                def obj = new JSONObject(li.getJsonDoc()).get("categoryName ").toString()
                arr.add(obj)
            }
            println"ARRAY---${arr}"
            if(arr.contains(catName) == true){
                //render "false"
                //return
                flash.message = "Category Name Already Exists"
                redirect(action: "index")
            }
            else{
                println"HERE"
                def result = storage.insertJSONDocument("shepmart", "shepmart", json)
                def addCategory = catalogue.createCategory("shepmart", catName, desc)
                if(result.isResponseSuccess() == true){
                    
                    redirect(action: "item")
                }
                // render "true"
                // return
            }
        }
        catch(App42Exception e){
            println"EXCEPTION---${e}"
            redirect(action: "index")
        }
         
    }

    def upload = {
        
        UploadService up = api.buildUploadService()
        Upload result = up.uploadFile("rohit", "D:/images.jpg", UploadFileType.IMAGE, "dsasfdf") 
        //  def result = up.removeFileByName("rohit") 
        println"RESULT-----${result}"
    }
    
    
    def testt = {
       
        
        //        ItemData itemData = new ItemData();   
        //        itemData.setDescription("BusisnsnsnsnSS");  
        //        itemData.setItemId("Id-012");  
        //        itemData.setName("ComputerssNet");  
        //        itemData.setPrice(20.0); 
        //        itemData.setImage("D:/images.jpg");  
        //        def result = catalogue.addItem("shepmart", "Business", itemData)
        //        println"RESULT---${result}"

         //def result = catalogue.createCatalogue("food", "food food")
         //def result = catalogue.createCategory("food", "food", "food")
        // println"RESULT--${result}"
         //      def catName = "Hardware"
         //      def desc = "Hardwaree"
         //       def json = "{\"categoryName \":\'"+catName+"', \"description \":\'"+desc+"'}"
        //        
        //           def checkStorage = storage.insertJSONDocument("shepmart", "shepmart", json)
        //           println checkStorage
        //def checkStorage = storage.findAllDocuments("shepmart", "shepmart")
        //     def checkStorage = storage.deleteDocumentById("shepmart", "shepmart", "507fc22ae4b0b58ceacbf4a7")
        //   println"CHECK STORAGE---${checkStorage}"
       
    }
   
}
