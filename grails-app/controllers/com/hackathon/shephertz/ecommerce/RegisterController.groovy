package com.hackathon.shephertz.ecommerce
import com.shephertz.app42.paas.sdk.java.user.User
import com.shephertz.app42.paas.sdk.java.user.UserService
import com.shephertz.app42.paas.sdk.java.shopping.Catalogue
import com.shephertz.app42.paas.sdk.java.shopping.CatalogueService
import com.shephertz.app42.paas.sdk.java.shopping.ItemData
import com.shephertz.app42.paas.sdk.java.ServiceAPI
import com.shephertz.app42.paas.sdk.java.App42Exception
import com.shephertz.app42.paas.sdk.java.App42NotFoundException
import org.json.JSONObject

class RegisterController {

    def baseURL = grailsApplication.config.baseURL
    ServiceAPI api = new ServiceAPI("b6f1119644d65c8787ac1dcccfa53e679f2dff692ad8ea926998884a10101754","39a1d4f3b7dd729af8c8a47d92a4147530deffb0f0d231081c2d0d6aa0d3a6d5")
    UserService user = api.buildUserService()
    CatalogueService catalogue = api.buildCatalogueService()
    
    def index = { 
        println"PARAMS---${params}"
        Catalogue catInstance = catalogue.getItems("shepmart")
        if(catInstance.isResponseSuccess() == true){
            if(params?.code == "2001"){
                flash.message = "Username already exists"
            }
            else if(params?.code == "2005"){
                flash.message = "Email Id already exists"
            }
            [catInstance: catInstance]
        }
        
    }
    
    def save = {
        println"PARAMS---${params}"
        try{
            User userInstance = user.createUser("${params.userName.trim()}", "${params.password.trim()}", "${params.email.trim()}")
            if(userInstance.isResponseSuccess() == true){
                redirect(Controller: "login", action: "index")
            }
        }
        catch(App42Exception e){
            println"E--${e}"
            if(e.getAppErrorCode() == 2001){
                redirect(action: "index", params:[code: "2001", userName: params.userName.trim(), email: params.email.trim()])
            }
            else if(e.getAppErrorCode() == 2005)  
            {  
                redirect(action: "index", params:[code: "2005", userName: params.userName.trim(), email: params.email.trim()])
            }  
        }
        
    }
}
