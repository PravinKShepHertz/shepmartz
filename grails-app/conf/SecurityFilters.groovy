
class SecurityFilters {

    def filters = {
        
        home(uri:'/home/addItemToCart/**')
        {
            before = {
                if(!session["userName"]) {
                    redirect(controller:"login",action:"index")
                    return false
                }
            }
        }
        
        home(uri:'/home/cart/**')
        {
            before = {
                if(!session["userName"]) {
                    redirect(controller:"login",action:"index")
                    return false
                }
            }
        }
        
        home(uri:'/home/details/**')
        {
            before = {
                if(!session["userName"]) {
                    redirect(controller:"login",action:"index")
                    return false
                }
            }
        }
        
        home(uri:'/home/saveAddress/**')
        {
            before = {
                if(!session["userName"]) {
                    redirect(controller:"login",action:"index")
                    return false
                }
            }
        }
        
        home(uri:'/home/checkout/**')
        {
            before = {
                if(!session["userName"]) {
                    redirect(controller:"login",action:"index")
                    return false
                }
            }
        }
        
        home(uri:'/home/makePayment/**')
        {
            before = {
                if(!session["userName"]) {
                    redirect(controller:"login",action:"index")
                    return false
                }
            }
        }
        
        
    }
    
}
