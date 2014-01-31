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
import org.json.JSONArray
import javax.servlet.http.Cookie
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

class HomeController {

    def baseURL = grailsApplication.config.baseURL
    ServiceAPI api = new ServiceAPI("b6f1119644d65c8787ac1dcccfa53e679f2dff692ad8ea926998884a10101754","39a1d4f3b7dd729af8c8a47d92a4147530deffb0f0d231081c2d0d6aa0d3a6d5")
    CatalogueService catalogue = api.buildCatalogueService()
    StorageService storage = api.buildStorageService()
    CartService cartService = api.buildCartService()
    javax.servlet.http.Cookie cookie = null
    
    def index = {
    
        Catalogue catInstance = catalogue.getItems("shepmart")
        if(catInstance.isResponseSuccess() == true){
            [catInstance: catInstance]
        }
    
    }
    
    def show = {
        
        Catalogue items = catalogue.getItemById("shepmart", "${params.category}", "${params.id}")
        println"ITEMS---${items}"
        [itemList: items]
    }
    
    def showPortal = {
        
        Catalogue items = catalogue.getItemsByCategory("shepmart", "${params.category}")
        println"ITEMS---${items}"
        [itemList: items]
    }
    
    
    def addItemToCart = {
        
        println"PARAMS-----${params}"
        Catalogue item = catalogue.getItemById("${params.catalogue}", "${params.category}", "${params.id}")
        def cookieValue = null
        def itemId = params.id + "," + "${params.category}"
        int quantity = 1
        println"PARAMS QUANTIRY---${params.quantity}"
        if(params?.quantity){
            quantity = new Integer(params.quantity)
        }
        println"ITEMID----${itemId}"
        println"ITEMID----${quantity}"
        Double price = new Double(item.getCategoryList()[0].getItemList()[0].getPrice())
        println"PRICE---${price}"
        
        if(request?.cookies?.name?.contains("app42") == true)
        {
            println"COOKIE FOUND BY NAME APP42---${request.cookies.name}"
            request.cookies.each{
                Cookie cookie = it
                if(cookie.name == "app42"){
                    cookieValue = cookie.value
                }
            }
            println"----COOKIE VALUE---${cookieValue}"
            try{
                Cart cartItem = cartService.addItem("${cookieValue}", "${itemId}", quantity, price)
                if(cartItem.isResponseSuccess() == true){
                    println"GET ITEM SUCCESSFULL----${cartItem}"
                    redirect(action: "cart", params:[category: params.category, catalogue: params.catalogue])
                }
                else{
                    println" GET ITEMS UNSUCCESSFULL"
                }
            }
            catch(App42Exception e){
                if(e.getAppErrorCode() == 3320){
                    quantity = quantity++
                    println"QUANTITY---_${quantity}"
                    Cart cartItem = cartService.addItem("${cookieValue}", itemId, quantity, price)
                    redirect(action: "cart", params:[category: params.category, catalogue: params.catalogue])
                }
            }
        }
        else{
            println" NEW CART CREATION ---- NEW COOKIE CREATION"
            def name = null
            if(session["userName"]){
                name = session["userName"] 
            }
            else{
                name = "guest"+new Date().getTime() 
            }
            Cart cartInstance = cartService.createCart(name) 
            if(cartInstance.isResponseSuccess() == true){
                println"CART CREATED SUCCESSFULLY"   
                Cart items = cartService.addItem("${cartInstance.getCartId()}", itemId, quantity, price)
                if(items.isResponseSuccess() == true){
                    cookie = new javax.servlet.http.Cookie('app42', "${cartInstance.getCartId()}")
                    cookie.setPath("/ShepMartz/home/");
                    response.addCookie(cookie)
                    redirect(action: "cart",params:[category: params.category, catalogue: params.catalogue])
                }
                else{
                    println"ITEM NOT ADDED"
                }
            } 
            else{
                
                println" CART NOT CREATED"
            }
        } 
        
        
        
    }
    
    def cart = {
       
        println"PARAMS---${params}----${request?.cookies}----${request.cookies.name}-------${session["cookie"]}"
        def cookieValue = null
        if(request?.cookies?.name?.contains("app42") == true)
        {
            println"COOKIE FOUND BY NAME APP42"
            if(request?.cookies != null){
                request.cookies.each{
                    Cookie cookie = it
                    if(cookie.name == "app42"){
                        cookieValue = cookie.value
                    }
                }
            }
            println"----COOKIE VALUE---${cookieValue}"
            def arrList = new ArrayList()
            def total = 0
            try{
                Cart cartItems = cartService.getItems("${cookieValue}")
                println"CART ITEMS---${cartItems}"
                if(cartItems.isResponseSuccess() == true){
                
                    cartItems.getItemList().each{item->
                        println"ITEM NAME----"
                        def arrTable = new Hashtable()
                        def category = item.getItemId().substring(item.getItemId().indexOf(",")+1,item.getItemId().size())
                        def itemId = item.getItemId().substring(0,item.getItemId().lastIndexOf(","))
                        println"CATEGORY---${category}----ITEMID----${itemId}"
                        Catalogue catInstance = null
                        if(category.equals("food")){
                            catInstance = catalogue.getItemById("food", "${category}", "${itemId}")
                        }
                        else{
                            catInstance = catalogue.getItemById("shepmart", "${category}", "${itemId}")
                        }
                        println "CARTINSTANCE--${catInstance}"
                        
                        println"GET ITEM BY ID CALLED"
                        arrTable.put("Item Image", catInstance.getCategoryList()[0].getItemList()[0].getUrl())
                        arrTable.put("Category", category)
                        arrTable.put("Item Name", catInstance.getCategoryList()[0].getItemList()[0].getName())
                        arrTable.put("Item Id", itemId)
                        arrTable.put("Item Price", item.getPrice())
                        arrTable.put("Quantity", item.getQuantity())
                        arrTable.put("Item Description", catInstance.getCategoryList()[0].getItemList()[0].getDescription())
                        arrTable.put("catalogue", params.catalogue)
                        total = new BigDecimal(total + (item.getPrice() * item.getQuantity()))
                        arrList.add(arrTable)
                    }
                    println"list---${arrList}"
                    [items: arrList, total: total, cartId: "${cookieValue}"]
                }
                else{
                    println" GET ITEMS UNSUCCESSFULL"
                }
            }
            catch(App42Exception e){
                if(e.getAppErrorCode() == 3304){
                    
                }
            }
        }   
        else{
            println"COOKIESS----${request}"
        }
    }
    
    def details = {
        println"PARAMS---${params}"
        // Cart items = cartService.checkOut(params.id); /* returns the Cart object. */  
        // if(items.isResponseSuccess() == true){
        redirect(action: "shippingDetails", params: [total: params.total, catalogue: params.catalogue, cartId: params.id])
        // }
    }
    
    def saveAddress = {
        
        println"PARAMS---${params}"
        session["userName"] = "rohit"
        def address = params.address
        def pin = params.pin
        def name = params.name
        def state = params.state
        def mobile = params.mobile
        def country = params.country
        def city = params.city
        def userName = session["userName"]
        
        // println"CATNAME-__${catName}"
        def json = "{\"userName \":\'"+userName+"', \"address \":\'"+address+"',\"name \":\'"+name+"', \"state \":\'"+state+"',\"mobile \":\'"+mobile+"', \"pin \":\'"+pin+"',\"city \":\'"+city+"', \"country \":\'"+country+"'}"
        def result = storage.insertJSONDocument("${userName}", "shipping", json)
        if(result.isResponseSuccess() == true){
            redirect(action: "checkout", params:[calalogue: params.catalogue, cartId: params.cartId])
        }
    
    }
    
    def checkout = {
        
        Cart cartItems = cartService.getItems("${params.cartId}")
        def total = 0
        def arrList = new ArrayList()
        if(cartItems.isResponseSuccess() == true){
                
            cartItems.getItemList().each{item->
                println"ITEM NAME----"
                def arrTable = new Hashtable()
                def category = item.getItemId().substring(item.getItemId().indexOf(",")+1,item.getItemId().size())
                def itemId = item.getItemId().substring(0,item.getItemId().lastIndexOf(","))
                println"CATEGORY---${category}----ITEMID----${itemId}"
                Catalogue catInstance = null
                if(category == "food"){
                    catInstance = catalogue.getItemById("food", "${category}", "${itemId}")
                }
                else{
                    catInstance = catalogue.getItemById("shepmart", "${category}", "${itemId}")
                }
                println"GET ITEM BY ID CALLED"
                arrTable.put("Item Image", catInstance.getCategoryList()[0].getItemList()[0].getUrl())
                arrTable.put("Category", category)
                arrTable.put("Item Name", catInstance.getCategoryList()[0].getItemList()[0].getName())
                arrTable.put("Item Id", itemId)
                arrTable.put("Item Price", item.getPrice())
                arrTable.put("Quantity", item.getQuantity())
                arrTable.put("Item Description", catInstance.getCategoryList()[0].getItemList()[0].getDescription())
                total = new BigDecimal(total + (item.getPrice() * item.getQuantity()))
                arrList.add(arrTable)
            }
            def arr = new ArrayList()
            //def checkStorage = storage.findAllDocuments("${session["userName"]}", "${session["userName"]}")
            def checkStorage = storage.findAllDocuments("${session["userName"]}", "shipping")
            println"CHECK STORAGE----${checkStorage.getJsonDocList()}"
            checkStorage.getJsonDocList().each{li->
                def table = new Hashtable()
                table.put("pin",new JSONObject(li.getJsonDoc()).get("pin ").toString())
                table.put("address",new JSONObject(li.getJsonDoc()).get("address ").toString())
                table.put("name",new JSONObject(li.getJsonDoc()).get("name ").toString())
                table.put("city",new JSONObject(li.getJsonDoc()).get("city ").toString())
                table.put("country",new JSONObject(li.getJsonDoc()).get("country ").toString())
                table.put("state",new JSONObject(li.getJsonDoc()).get("state ").toString())
                table.put("mobile",new JSONObject(li.getJsonDoc()).get("mobile ").toString())
                arr.add(table)
            }
            def month = new ArrayList()
            month.add("Jan")
            month.add("Feb")
            month.add("Mar")
            month.add("Apr")
            month.add("May")
            month.add("Jun")
            month.add("Jul")
            month.add("Aug")
            month.add("Sep")
            month.add("Oct")
            month.add("Nov")
            month.add("Dec")

            def year = new ArrayList()
            year.add("2012")
            year.add("2013")
            year.add("2014")
            year.add("2015")
            year.add("2016")
            year.add("2017")
            year.add("2018")
            year.add("2019")
            year.add("2020")
            year.add("2021")
            year.add("2022")
            year.add("2023")
            year.add("2024")
            year.add("2025")
            year.add("2026")
            year.add("2027")
            year.add("2028")
            year.add("2029")
            year.add("2030")
            [items: arrList, total: total, cartId: "${params.cartId}", address: arr, month: month, year: year]
        }
        else{
            println" GET ITEMS UNSUCCESSFULL"
        }
        
    }
    
    def makePayment = {
        
        println"PARAMS----${params}"
        Cart cartInstance = cartService.getItems(params.cartId)
        def userName = session["userName"]
        def result = null
        cartInstance.getItemList().each{
            def jsonObject = new JSONObject()
            def itemId = it.getItemId()
            def quantity = it.getQuantity()
            def price = it.getPrice()
            def totalPrice = it.getTotalAmount()
            
            def json = "{\"userName \":\'"+userName+"', \"itemId \":\'"+itemId.toString()+"',\"quantity \":\'"+quantity.toString()+"', \"price \":\'"+price.toString()+"',\"totalPrice \":\'"+totalPrice.toString()+"', \"grandTotal \":\'"+params.total+"',\"status \":\'pending'}"
            try{
                result = storage.insertJSONDocument("${userName}", "paymentHistory", json)
            }
            catch(App42Exception e){
                println"EXCEPTIOn---${e}"
            }
        }
        
        println"JSON OBNJECT----${result}"
        try{
            Cookie cookie = new Cookie("app42", "${params.cartId}")
            cookie.setPath("/ShepMartz/home/");
            cookie.setMaxAge(0);
            response.addCookie(cookie)
            def cartObj = cartService.removeAllItems(params.cartId)
            if(cartObj.isResponseSuccess() == true){
                println"ITEMS REMOVED"
                redirect(action: "orderHistory")
            }
        }
        catch(App42Exception e){
            println"EXCEPTION---${e}"
            if(e.getAppErrorCode() == 3304){
                redirect(action: "index")
            }
        }
        
    }
    
    def orderHistory = {
        
        
        println"PARAMS---${params}"
        def arr = new ArrayList()
           
        try{
            def result = storage.findAllDocuments("${session["userName"]}", "paymentHistory") 
            println"----${result.getJsonDocList()}"
            result.getJsonDocList().each{
                def table = new Hashtable()
                def item = new JSONObject(it.getJsonDoc()).get("itemId ").toString()
                def category = item.substring(item.indexOf(",")+1,item.size())
                def itemId = item.substring(0,item.lastIndexOf(","))
                Catalogue catInstance = null
                if(category.equals("food")){
                    catInstance = catalogue.getItemById("food", "${category}", "${itemId}")
                }
                else{
                    catInstance = catalogue.getItemById("shepmart", "${category}", "${itemId}")
                }
                def itemName = catInstance.getCategoryList()[0].getItemList()[0].getName()
                def itemImage = catInstance.getCategoryList()[0].getItemList()[0].getUrl()
                println"IMAGE---${itemImage}"
                def price = new JSONObject(it.getJsonDoc()).get("price ").toString()
                def totalPrice = new JSONObject(it.getJsonDoc()).get("totalPrice ").toString()
                def quantity = new JSONObject(it.getJsonDoc()).get("quantity ").toString()
                def status = new JSONObject(it.getJsonDoc()).get("status ").toString()
                def grandTotal = new JSONObject(it.getJsonDoc()).get("grandTotal ").toString()
                table.put("itemId", itemId)
                table.put("itemName", itemName)
                table.put("itemImage", itemImage)
                table.put("price", price)
                table.put("totalPrice", totalPrice)
                table.put("quantity", quantity)
                table.put("status", status)
                table.put("grandTotal", grandTotal)
                arr.add(table)
            }
            [items: arr]
        }
        catch(App42Exception e){
            if(e.getAppErrorCode() == 2602){
              
              [items: arr]  
            }
            
        }
    }
    
    
    def shippingDetails = {
       
        
        def list = new ArrayList()
        list.add("Andaman & Nicobar")
        list.add("Andhra Pradesh")
        list.add("Arunachal Pradesh")
        list.add("Assam")
        list.add("Bihar")
        list.add("Chandigarh")
        list.add("Chattisgarh")
        list.add("Goa")
        list.add("Gujarat")
        list.add("Himachal Pradesh")
        list.add("Haryana")
        list.add("Jammu & Kashmir")
        list.add("Jharkhand")
        list.add("Karnataka")
        list.add("Kerala")
        list.add("Madhya Pradesh")
        list.add("Maharashtra")
        list.add("Orissa")
        list.add("Punjab")
        list.add("Rajasthan")
        list.add("Uttar Pradesh")
        list.add("Uttarakhand")
        list.add("West Bengal")
        
        [list: list]
    }
    
    def testt = {
        
        //        request.cookies.each{
        //            println"IT---${it}"
        //            println"IT---${it.name}"
        //        }
        //def name = "guest"+new Date().getTime()
        //            println"${name}"
        //println"---${request.cookies.find.name["name"]}"
        //        def id = null
        //        request.cookies.eachWithIndex{coo,i->
        //            println"III---${i}---${coo}"
        //            Cookie cookie = request.cookies[i]
        //            if(cookie.name == "name"){
        //                id = cookie.value
        //            }
        //        }
        //        println"ID---${id}"
        
        //        def id = "Item100,Shoping"
        //        def cat = id.substring(id.indexOf(",")+1,id.size())
        //        int siz = new Integer(cat.size())
        //        println"-------${id.substring(id.indexOf(",")+1,id.size())}"
        //        println"-------${id.substring(0,id.lastIndexOf(","))}"
        //        
        //        println"-----${id.substring(id.indexOf(",")+1,id.size()).size()}"
        //        println"-------${id.substring(id.lastIndexOf(",")-siz,id.size())}"

        // session["userName"] = "rohit"

    }
    
    
    def cook = {
        
        //        cookie = new javax.servlet.http.Cookie('name', '123'); 
        //        //def cookie = new Cookie("App42", "12888")
        //        println"COO--${cookie.getName()}"
        //        response.addCookie(cookie)

        //    println"SESSION----${session["cookie"]}"
       
    }
    
    def fish = {
        
        //session["userName"] = "rohit"
        println"COOKIE FOUND BY NAME APP42---${request.getCookies()}"
    }
        
}
