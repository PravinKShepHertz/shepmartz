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

class LoginController {

    def baseURL = grailsApplication.config.baseURL
    ServiceAPI api = new ServiceAPI("b6f1119644d65c8787ac1dcccfa53e679f2dff692ad8ea926998884a10101754","39a1d4f3b7dd729af8c8a47d92a4147530deffb0f0d231081c2d0d6aa0d3a6d5")
    UserService user = api.buildUserService()
    CatalogueService catalogue = api.buildCatalogueService()
    
    def index = { 
    
        if(!session["userName"]){
            Catalogue catInstance = catalogue.getItems("shepmart")
            if(catInstance.isResponseSuccess() == true){
                if(params?.code == "2002"){
                    flash.message = "UserName/Password did not match"
                }
                [catInstance: catInstance]
            }
        }
        else{
            redirect(controller: "home", action: "index")
        }
    }
    
    def save = {
        
        if(!session["userName"]){
            try{
                def userInstance = user.authenticate("${params.userName.trim()}", "${params.password.trim()}")
                println"USER ----${user}"
                if(userInstance.isResponseSuccess() == true){
                    session["userName"] = params.userName.trim()
                    println"SESSION---${session["userName"]}"
                    println"SESSION---${session["ref"]}"
                    if(session["ref"]){
                        println"I M IN"
                        //redirect(url:"${baseURL}/${session["ref"].controller}/${session["ref"].action}/${session["ref"].id}?catalogue=${session["ref"].catalogue}&category=${session["ref"].category}") 
                        redirect(controller: "${session["ref"].controller}", action: "${session["ref"].action}", params: [catalogue: session["ref"].catalogue, category: session["ref"].category, id: session["ref"].id]) 
                    }
                    else{
                        redirect(controller: "home", action: "index")
                    }
                }
            }
            catch(App42Exception e){
                if(e.getAppErrorCode() == 2002){
                    redirect(action: "index", params:[code: "2002", userName: params.userName.trim()])
                }
            }
        }
        else{
            redirect(controller: "home", action: "index")
        }
        
    }
    
    def logout = {
        
        //    session.removeValue("userName")
        session.invalidate()
        redirect(action: "index")
        
    }
    
    
}
