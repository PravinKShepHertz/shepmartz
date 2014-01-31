/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
var appType
var sortOrder
function findByCategory(category)
{ 
  
    var orderby = "";
    var sortby =  $("#sort").val();
    if(sortby == "name"){
        sortOrder = "&sortOrder=asc"
    }else {
        sortOrder = "&sortOrder=desc"
    }
    var extra = ""
    if(sortby !="")
        orderby = "&sortby="+sortby
    if(appType=="MOBILE"){
        extra = "&tab=mob"
    }

    //alert(location.protocol+'//'+location.host+location.pathname); return false;
    //window.location.href='category?type='+category+orderby;
    window.location.href=location.protocol+'//'+location.host+location.pathname+'?type='+category+orderby+extra+sortOrder;
    

}

function findByMax(category)
{

    var orderby = "";
    var sortby =  $("#sort").val();
    var max =  $("#max").val();
    if(sortby == "name"){
        sortOrder = "&sortOrder=asc"
    }else {
        sortOrder = "&sortOrder=desc"
    }
    var extra = ""
    if(sortby !="")
        orderby = "&sortby="+sortby
    if(appType=="MOBILE"){
        extra = "&tab=mob"
    }

    //alert(location.protocol+'//'+location.host+location.pathname); return false;
    //window.location.href='category?type='+category+orderby;
    window.location.href=location.protocol+'//'+location.host+location.pathname+'?type='+category+orderby+extra+sortOrder+'&max='+max;


}

function sortBysearchKeyword(keyword)
{
    var orderby = "";
    var sortby =  $("#sort").val();

    if(sortby !="")
        orderby = "&sortby="+sortby

    //alert(location.protocol+'//'+location.host+location.pathname); return false;
    //window.location.href='category?type='+category+orderby;
    window.location.href=location.protocol+'//'+location.host+location.pathname+'?search='+keyword+orderby;
}

function sel_category(categoryValue,sortValue)
{

    //alert(sortValue)
    //    if(categoryValue)
    //    {
    //        for(var i=0; i<document.myForm.category.length; i++)
    //        {
    //            if(document.myForm.category.options[i].value == categoryValue)
    //                document.myForm.category[i].selected = "1";
    //        }
    //    }
    //var w = document.myForm.category.selectedIndex;
    //document.myForm.category.options[w].text = "BUSINESS";
    //alert(selected_text);
    if(sortValue)
    {
        for(var i=0; i<document.myForm.sort.length; i++)
        {
            if(document.myForm.sort.options[i].value == sortValue)
                document.myForm.sort[i].selected = "1";
        }
    }
}

function getPackage(id){
    //alert(id); //return false;
    document.getElementById("price").value = '';
    document.getElementById("duration").value = '';
    $.ajax({
        type: "POST",
        url: '/PAE_WEB/bazaar/ajaxgetschemePackage',
        data: "id="+id,
        complete: function(data){
            //print results as appended
            //var packages = eval("("+ data.responseText +")" )	// evaluate JSON
            // var packages = '<div class="FormColumn" id="selectPackages"> <label for="CpackageId">Package :</label><select  id="packageId" name="packageId" onchange="getPackageDetails(this.value)"  >'+data.responseText+'</select></div>';
            var packages = '<div class="FormColumn" id="selectPackages"> <label for="CpackageId">Package :</label><select  id="packageId" name="packageId" onchange="getPackageDetails(this.value)"  ><option value="select">Select Package..</option>'+data.responseText+'</select></div>';
            document.getElementById("selectPackages").innerHTML = packages;
        //alert(data.responseText);
        //var fabrics = data.responseText	// evaluate JSON




        }
    });
}
function getPackageDetails(id){
    //alert(id);
    if(id=="null") return false;
    else if(id == "select") {
        document.getElementById("price").value = "";
        document.getElementById("duration").value = "";
    }
    else{
        $.ajax({
            type: "POST",
            url: '/PAE_WEB/bazaar/ajaxgetpackageDetails',
            data: "id="+id,
            beforeSend: function(){
            //        $("#subscriptionForm").mask("Waiting...");
            },
            complete: function(data){
                //print results as appended
                var packages = eval("("+ data.responseText +")" )	// evaluate JSON

                //alert(packages.packages.price);
                document.getElementById("price").value = packages.packages.price;
                document.getElementById("duration").value = packages.packages.duration;
            //alert(data.responseText);
            //var fabrics = data.responseText	// evaluate JSON
            //  $("#subscriptionForm").unmask();




            }
        });
    }
}


function checkRenewable(){


    var today=new Date();
    var minusOneMonthExpiryDate=new Date($("#expiryDate").val());

    var currentMonth=minusOneMonthExpiryDate.getMonth() -1;
    minusOneMonthExpiryDate.setMonth(currentMonth);
    var currentYear=minusOneMonthExpiryDate.getFullYear();

    if(today<minusOneMonthExpiryDate)
    {
        alert("You can renew only in the last Month of Subscription."+"Starting from :"+ minusOneMonthExpiryDate);
        return false;
    }

    return true;

}

function selectCategory(selectedId){
    var i;
    var my_cars= new Array()
    my_cars["1"]="BUSINESS";
    my_cars["2"]="ENTERPRISE";
    my_cars["3"]="UTILITY";
    my_cars["4"]="EDUCATION";
    my_cars["5"]="ENTERTAINMENT";
    my_cars["6"]="FINANCE";
    my_cars["7"]="HEALTH";
    my_cars["8"]="SNS";
    my_cars["9"]="NAVIGATION";
    my_cars["10"]="AUDIO";
    my_cars["11"]="NEWS";
    my_cars["12"]="EBOOKS";
    my_cars["13"]="SHOPPING";
    // alert(my_cars.length);
    for(i=1; i<=13; i++)
    {
        // var catId = my_cars[selectedId];
        // alert(catId+"--"+selectedId);
        // var cat = document.getElementById(catId); // $("#cat"+i);
        //alert($("#cat").);
        if(my_cars[i]==selectedId)
        {
            //alert("dsadsad");
            // document.getElementByName("cat"+i).className = "selected";
            $("#cat"+i).addClass("selected");
        }
        else
        {
    //cat.removeClass("selected");
    }
    }

}
