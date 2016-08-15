
/**************************************************************************************************
                                            Global Variables
 **************************************************************************************************/

/// <summary>
/// Site Catalyst Info
/// </summary>
var mSiteCatalystInfo = {};
/// <summary>
/// Customer Name
/// </summary>
var mCustomerName = "";
/// <summary>
/// Shopping List Items Array
/// </summary>
var mSiteCatalystShoppingListItems = [];
/// <summary>
/// shopping list Page Service Url
/// </summary>
var mSiteCatalystShoppingListPageWebServiceUrl = document.location.protocol + '//' + document.location.host + '/WebService/ShoppingList.asmx/';

/**************************************************************************************************
                                            Initialize Methods
 **************************************************************************************************/
/// <summary>
/// SiteCatalyst Initialize
/// </summary>
/// <param name="absolutePath"></param>
/// <param name="ConsumerID"></param>
/// <param name="ConsumerCardNumber"></param>
/// <param name="ReportSuiteId"></param>
/// <param name="ChainName"></param>
/// <param name="ChainId"></param>
/// <param name="StoreId"></param>
 function SiteCatalyst_InitializeTracking(absolutePath, ConsumerID, ConsumerCardNumber, ReportSuiteId, ChainName, ChainId, StoreId)
 {
    // Remove the aspx
    var sabsolutePath = absolutePath.replace(".aspx", "");
    var Channel = new String("");
    var PageName = new String("");
    var PageFriendlyName = new String("");
    
    // Split the absolute path
    var absolutePathArray = sabsolutePath.split("/");
    if (absolutePathArray.length > 0)
    {
        if (absolutePathArray.length == 1)
        {
            // We are on the home page
            Channel = "home";
            PageName = "home page";
            PageFriendlyName = "home page";
        }
        else if (absolutePathArray.length == 2)
        {
            // We are on the home page
            Channel = "home";
            PageName = absolutePathArray[1];
            PageFriendlyName = absolutePathArray[1];
        }
        else if (absolutePathArray.length >= 3)
        {
            // We are on the home page
            Channel = absolutePathArray[1];
            PageName = absolutePathArray[2];
            PageFriendlyName = absolutePathArray[2];
        }

        // Initialize 
        SiteCatalyst_Initialize(Channel, PageName, PageFriendlyName, ConsumerID, ConsumerCardNumber, ReportSuiteId, ChainName, ChainId, StoreId);
    }
 }
/// <summary>
/// SiteCatalyst Initialize
/// </summary>
/// <param name="Channel"></param>
/// <param name="PageName"></param>
/// <param name="PageFriendlyName"></param>
/// <param name="ConsumerID"></param>
/// <param name="ConsumerCardNumber"></param>
/// <param name="ReportSuiteId"></param>
/// <param name="ChainName"></param>
/// <param name="ChainId"></param>
/// <param name="StoreId"></param>
function SiteCatalyst_Initialize(Channel, PageName, PageFriendlyName, ConsumerID, ConsumerCardNumber, ReportSuiteId, ChainName, ChainId, StoreId)
{
    // Assign properties
    mSiteCatalystInfo.ConsumerID = ConsumerID;
    mSiteCatalystInfo.ConsumerCardNumber = ConsumerCardNumber;
    mSiteCatalystInfo.ReportSuiteId = ReportSuiteId;
    mSiteCatalystInfo.ChainId = ChainId;
    mSiteCatalystInfo.StoreId = StoreId;

    // Init the account
    s_account =  mSiteCatalystInfo.ReportSuiteId;                   				// Store the account name
    s = s_gi(s_account);                                            				// Log in.
    s.linkInternalFilters = "javascript:," + ChainName.toLowerCase() + ".com";              	// internal filter
    s.trackingServer = "gsn.122.2o7.net";                           				// tracking server
    s.visitorNamespace = "gsn";                                     				// namespace
    s.charSet="ISO-8859-1";
    
    s.currencyCode="USD";
    
    s.debugTracking = true;
    
    s.trackDownloadLinks=true;
    
    s.trackExternalLinks=true;
    
    s.trackInlineStats=true;
    
    s.linkDownloadFileTypes="exe,zip,wav,mp3,mov,mpg,avi,wmv,doc,pdf,xls";
    
    s.linkLeaveQueryString=true;
    
    s.linkTrackVars="None";
    
    s.linkTrackEvents="None";

    
    s.getQueryParam=new Function("p","d","u","" +"var s=this,v='',i,t;d=d?d:'';u=u?u:(s.pageURL?s.pageURL:s.wd.locati"+"on);if(u=='f')u=s.gtfs().location;while(p){i=p.indexOf(',');i=i<0?p"
    +".length:i;t=s.p_gpv(p.substring(0,i),u+'');if(t){t=t.indexOf('#')>-"
    +"1?t.substring(0,t.indexOf('#')):t;}if(t)v+=v?d+t:t;p=p.substring(i="
    +"=p.length?i:i+1)}return v");
    
    s.p_gpv=new Function("k","u",""
    +"var s=this,v='',i=u.indexOf('?'),q;if(k&&i>-1){q=u.substring(i+1);v"
    +"=s.pt(q,'&','p_gvf',k)}return v");
    
    s.p_gvf=new Function("t","k",""
    +"if(t){var s=this,i=t.indexOf('='),p=i<0?t:t.substring(0,i),v=i<0?'T"
    +"rue':t.substring(i+1);if(p.toLowerCase()==k.toLowerCase())return s."
    +"epa(v)}return ''");

    /* Plugin Config */
    s.usePlugins=true;

    function s_doPlugins(s) {

         /* Add calls to plugins here */
	    s.campaign=s.getQueryParam("cid");
    }
    s.doPlugins=s_doPlugins;

    // Assign these values.
    s.pageName = ChainName + ":" + Channel + ":" + PageName;        // Page name
    s.channel  = ChainName + ":" + Channel;                         // Channel Name
    s.prop2 = s.pageName;                                           // Page Name
    s.prop3 = s.pageName;                                           // Page Name
    s.prop4 = PageFriendlyName;
    s.prop5 = "Desktop Web";
    s.prop6 = ChainId;
    s.prop8 = StoreId;
    s.eVar2 = s.prop2;
    s.eVar3 = s.prop3;
    s.eVar4 = s.prop4;
    s.eVar5 = s.prop5;
    s.eVar6 = s.prop6;
    s.eVar9 = ConsumerID;
    s.eVar15 = s.prop8;
    s.prop7 = "";
    s.events = "";
    s.prop1 = "";
    s.eVar1 = "";
    s.eVar7 = "";

    // Write the code.
    var s_code = s.t();
    if (s_code) {
        document.write(s_code);
    }
}

/**************************************************************************************************
                                            Tracking Methods
 **************************************************************************************************/

/// <summary>
/// Print Shopping List Coupons
/// </summary>
/// <param name="couponIds"></param>
function SiteCatalyst_PrintShoppingListCoupons(shoppingList)
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,List1';
    s.linkTrackEvents = 'event18';
    s.List1 = shoppingList;
    s.events = 'event18';
    s.tl(this,'o','Print Coupon');
}
/// <summary>
/// Add Coupon To Card
/// </summary>
/// <param name="couponId"></param>
function SiteCatalyst_AddCouponToLoyaltyCard(couponId, itemType, description) 
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,eVar8,eVar24,eVar25';
    s.linkTrackEvents = 'event15';
    s.eVar8 = couponId
    s.prop24 = itemType;
    s.eVar24 = s.prop24;
    s.prop25 = description;
    s.eVar25 = s.prop25;
    s.events = 'event15';
    s.tl(this, 'o', 'Add Coupon To Loyalty Card');
}
/// <summary>
/// Add Coupon To Card
/// </summary>
/// <param name="couponId"></param>
function SiteCatalyst_RemoveCouponFromLoyaltyCard(couponId, itemType, description)
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,eVar8';
    s.linkTrackEvents = 'event17';
     s.eVar8 = couponId
    s.prop24 = itemType;
    s.eVar24 = s.prop24;
    s.prop25 = description;
    s.eVar25 = s.prop25;
    s.events = 'event17';
    s.tl(this, 'o', 'Remove Coupon From Loyalty Card');
}
/// <summary>
/// Add Coupon To List
/// </summary>
/// <param name="couponId"></param>
function SiteCatalyst_AddManufacturerCouponToShoppingList(couponId, itemType, description)
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,eVar8';
    s.linkTrackEvents = 'event14';
    s.eVar8 = couponId
    s.prop24 = itemType;
    s.eVar24 = s.prop24;
    s.prop25 = description;
    s.eVar25 = s.prop25;
    s.events = 'event14';
    s.tl(this, 'o', 'Add Manufacturer Coupon To Shopping List');
}
/// <summary>
/// Add Coupon To List
/// </summary>
/// <param name="couponId"></param>
function SiteCatalyst_AddFeaturedProductCouponToShoppingList(couponId, itemType, description)
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,eVar8';
    s.linkTrackEvents = 'event14';
    s.eVar8 = couponId
    s.prop24 = itemType;
    s.eVar24 = s.prop24;
    s.prop25 = description;
    s.eVar25 = s.prop25;
    s.events = 'event14';
    s.tl(this, 'o', 'Add Featured Product Coupon To Shopping List');
}
/// <summary>
/// Add Coupon To List
/// </summary>
/// <param name="couponId"></param>
function SiteCatalyst_AddStoreCouponToShoppingList(couponId, itemType, description)
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,eVar8';
    s.linkTrackEvents = 'event14';
    s.eVar8 = couponId
    s.prop24 = itemType;
    s.eVar24 = s.prop24;
    s.prop25 = description;
    s.eVar25 = s.prop25;
    s.events = 'event14';
    s.tl(this, 'o', 'Add Store Coupon To Shopping List');
}
/// <summary>
/// Add Coupon To List
/// </summary>
/// <param name="couponId"></param>
function SiteCatalyst_AddYouTechCouponToShoppingList(couponId, itemType, description)
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,eVar8';
    s.linkTrackEvents = 'event14';
    s.eVar8 = couponId
    s.prop24 = itemType;
    s.eVar24 = s.prop24;
    s.prop25 = description;
    s.eVar25 = s.prop25;
    s.events = 'event14';
    s.tl(this, 'o', 'Add YouTech Coupon To Shopping List');
}
/// <summary>
/// Remove Coupon To List
/// </summary>
/// <param name="couponId"></param>
function SiteCatalyst_RemoveCouponFromShoppingList(couponId, itemType, description)
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,eVar8';
    s.linkTrackEvents = 'event16';
    s.eVar8 = couponId
    s.prop24 = itemType;
    s.eVar24 = s.prop24;
    s.prop25 = description;
    s.eVar25 = s.prop25;
    s.events = 'event16';
    s.tl(this, 'o', 'Remove Coupon from Shopping List');
}
/// <summary>
/// Add Multiple Coupon To Shopping List
/// </summary>
/// <param name="couponId"></param>
function SiteCatalyst_AddMultipleCouponToShoppingList(shoppingList)
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,List1';
    s.linkTrackEvents = 'event23';
    s.List1 = shoppingList;
    s.events = 'event23';
    s.tl(this, 'o', 'Add Multiple Coupons to Shopping List');
}
/// <summary>
/// Sort By Department
/// </summary>
/// <param name="couponId"></param>
function SiteCatalyst_SortCouponByDepartment(department)
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,eVar1';
    s.linkTrackEvents = 'event13';
    s.prop1 = department;
    s.eVar1 = s.prop1;
    s.events = 'event13';
    s.tl(this, 'o', 'Sort Coupons by Department');
}
/// <summary>
/// Print Shopping List
/// </summary>
/// <param name="couponIds"></param>
function SiteCatalyst_PrintShoppingList(shoppingList)
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,List1';
    s.linkTrackEvents = 'event40';
    s.List1 = shoppingList;
    s.events = 'event40';
    s.tl(this,'o','Print Shopping List');
}
/// <summary>
/// Save Shopping List
/// </summary>
/// <param name="couponIds"></param>
function SiteCatalyst_SaveShoppingList(shoppingList)
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,List1';
    s.linkTrackEvents = 'event43';
    s.List1 = shoppingList;
    s.events = 'event43';
    s.tl(this,'o','Save Shopping List');
}
/// <summary>
/// Add Circular Item To Shopping List
/// </summary>
function SiteCatalyst_AddCircularItemToShoppingList(itemId, itemType, description) 
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,eVar22,eVar24,eVar25';
    s.linkTrackEvents = 'event30';
    s.prop22 = itemId;
    s.eVar22 = s.prop22;
    s.prop24 = itemType;
    s.eVar24 = s.prop24;
    s.prop25 = description;
    s.eVar25 = s.prop25;
    s.events = 'event30';
    s.tl(this, 'o', 'Add Circular Item To Shopping List');
}
/// <summary>
/// Remove Circular Item To Shopping List
/// </summary>
function SiteCatalyst_RemoveCircularItemFromShoppingList(itemId, itemType, description) 
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,eVar22,eVar24,eVar25';
    s.linkTrackEvents = 'event31';
    s.prop22 = itemId;
    s.eVar22 = s.prop22;
    s.prop24 = itemType;
    s.eVar24 = s.prop24;
    s.prop25 = description;
    s.eVar25 = s.prop25;
    s.events = 'event31';
    s.tl(this, 'o', 'Remove Circular Item To Shopping List');
}
/// <summary>
/// Add Circular Item To Shopping List
/// </summary>
/// <param name="ListOfCircularItems"></param>
function SiteCatalyst_AddListOfCircularItemsToShoppingList(ListOfCircularItems) {
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,List1,eVar24';
    s.linkTrackEvents = 'event36';
    s.prop24 = 8;
    s.eVar24 = 8;
    s.List1 = ListOfCircularItems;
    s.events = 'event36';
    s.tl(this, 'o', 'Add List Of Circular Items To Shopping List');
}
/// <summary>
/// Remove Circular Item To Shopping List
/// </summary>
/// <param name="ListOfCircularItems"></param>
function SiteCatalyst_RemoveListOfCircularItemsFromShoppingList(ListOfCircularItems) {
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,List1,eVar24';
    s.linkTrackEvents = 'event37';
    s.prop24 = 8;
    s.eVar24 = 8;
    s.List1 = ListOfCircularItems;
    s.events = 'event37';
    s.tl(this, 'o', 'Remove List Of Circular Items To Shopping List');
}
/// <summary>
/// Add Ad Pod From Shopping List
/// </summary>
/// <param name="description"></param>
function SiteCatalyst_AddAdPodToShoppingList(itemId, itemType, description) 
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,eVar22,eVar24,eVar25';
    s.linkTrackEvents = 'event34';
    s.prop22 = itemId;
    s.eVar22 = s.prop22;
    s.prop24 = itemType;
    s.eVar24 = s.prop24;
    s.prop25 = description;
    s.eVar25 = s.prop25;
    s.events = 'event34';
    s.tl(this, 'o', 'Add Ad Pod To Shopping List');
}
/// <summary>
/// Remove Ad Pod From Shopping List
/// </summary>
/// <param name="description"></param>
function SiteCatalyst_RemoveAdPodFromShoppingList(itemId, itemType, description) 
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,eVar22,eVar24,eVar25';
    s.linkTrackEvents = 'event35';
    s.prop22 = itemId;
    s.eVar22 = s.prop22;
    s.prop24 = itemType;
    s.eVar24 = s.prop24;
    s.prop25 = description;
    s.eVar25 = s.prop25;
    s.events = 'event35';
    s.tl(this, 'o', 'Remove Ad Pod from Shopping List');
}
/// <summary>
/// Add Your Own To List
/// </summary>
/// <param name="description"></param>
function SiteCatalyst_AddYourOwnToShoppingList(itemId, itemType, description) 
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,eVar22,eVar24,eVar25';
    s.linkTrackEvents = 'event32';
    s.prop22 = itemId;
    s.eVar22 = s.prop22;
    s.prop24 = itemType;
    s.eVar24 = s.prop24;
    s.prop25 = description;
    s.eVar25 = s.prop25;
    s.events = 'event32';
    s.tl(this, 'o', 'Add Your Own Item To Shopping List');
}
/// <summary>
/// Remove Your Own From Shopping List
/// </summary>
/// <param name="description"></param>
function SiteCatalyst_RemoveYourOwnFromShoppingList(itemId, itemType, description) 
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,eVar22,eVar24,eVar25';
    s.linkTrackEvents = 'event33';
    s.prop22 = itemId;
    s.eVar22 = s.prop22;
    s.prop24 = itemType;
    s.eVar24 = s.prop24;
    s.prop25 = description;
    s.eVar25 = s.prop25;
    s.events = 'event33';
    s.tl(this, 'o', 'Remove Your Own Item from Shopping List');
}
/// <summary>
/// Add product To List
/// </summary>
/// <param name="description"></param>
function SiteCatalyst_AddProductToShoppingList(itemId, itemType, description) 
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,eVar22,eVar24,eVar25';
    s.linkTrackEvents = 'event28';
    s.prop22 = itemId;
    s.eVar22 = s.prop22;
    s.prop24 = itemType;
    s.eVar24 = s.prop24;
    s.prop25 = description;
    s.eVar25 = s.prop25;
    s.events = 'event28';
    s.tl(this, 'o', 'Add Product To Shopping List');
}
/// <summary>
/// Remove Product From Shopping List
/// </summary>
/// <param name="description"></param>
function SiteCatalyst_RemoveProductFromShoppingList(itemId, itemType, description) 
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,eVar22,eVar24,eVar25';
    s.linkTrackEvents = 'event29';
    s.prop22 = itemId;
    s.eVar22 = s.prop22;
    s.prop24 = itemType;
    s.eVar24 = s.prop24;
    s.prop25 = description;
    s.eVar25 = s.prop25;
    s.events = 'event29';
    s.tl(this, 'o', 'Remove Product from Shopping List');
}
/// <summary>
/// Add Category To List
/// </summary>
/// <param name="description"></param>
function SiteCatalyst_AddCategoryToShoppingList(itemId, itemType, description) 
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,eVar22,eVar24,eVar25';
    s.linkTrackEvents = 'event26';
    s.prop22 = itemId;
    s.eVar22 = s.prop22;
    s.prop24 = itemType;
    s.eVar24 = s.prop24;
    s.prop25 = description;
    s.eVar25 = s.prop25;
    s.events = 'event26';
    s.tl(this, 'o', 'Add Category To Shopping List');
}
/// <summary>
/// Remove Category From Shopping List
/// </summary>
/// <param name="description"></param>
function SiteCatalyst_RemoveCategoryFromShoppingList(itemId, itemType, description) 
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,eVar22,eVar24,eVar25';
    s.linkTrackEvents = 'event27';
    s.prop22 = itemId;
    s.eVar22 = s.prop22;
    s.prop24 = itemType;
    s.eVar24 = s.prop24;
    s.prop25 = description;
    s.eVar25 = s.prop25;
    s.events = 'event27';
    s.tl(this, 'o', 'Remove Category from Shopping List');
}
/// <summary>
/// Add Catalog Item To Shopping List
/// </summary>
function SiteCatalyst_AddCatalogItemToShoppingList(itemId, itemType, description) 
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,eVar22,eVar24,eVar25';
    s.linkTrackEvents = 'event38';
    s.prop22 = itemId;
    s.eVar22 = s.prop22;
    s.prop24 = itemType;
    s.eVar24 = s.prop24;
    s.prop25 = description;
    s.eVar25 = s.prop25;
    s.events = 'event38';
    s.tl(this, 'o', 'Add Catalog Item To Shopping List');
}
/// <summary>
/// Remove Catalog Item from Shopping List
/// </summary>
function SiteCatalyst_RemoveCatalogItemFromShoppingList(itemId, itemType, description) 
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,eVar22,eVar24,eVar25';
    s.linkTrackEvents = 'event39';
    s.prop22 = itemId;
    s.eVar22 = s.prop22;
    s.prop24 = itemType;
    s.eVar24 = s.prop24;
    s.prop25 = description;
    s.eVar25 = s.prop25;
    s.events = 'event39';
    s.tl(this, 'o', 'Remove Catalog Item from Shopping List');
}
/// <summary>
/// Add Item Comment To Shopping List
/// </summary>
function SiteCatalyst_AddItemCommentToShoppingList(itemId, itemType, comment) 
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,eVar22,eVar24,eVar28';
    s.linkTrackEvents = 'event24';
    s.prop22 = itemId;
    s.eVar22 = s.prop22;
    s.prop24 = itemType;
    s.eVar24 = s.prop24;
    s.eVar28 = comment;
    s.events = 'event24';
    s.tl(this, 'o', 'Add Item Comment To Shopping List');
}
/// <summary>
/// Remove Item Comment From Shopping List
/// </summary>
function SiteCatalyst_RemoveItemCommentFromShoppingList(itemId, itemType, comment) 
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,eVar22,eVar24,eVar28';
    s.linkTrackEvents = 'event25';
    s.prop22 = itemId;
    s.eVar22 = s.prop22;
    s.prop24 = itemType;
    s.eVar24 = s.prop24;
    s.eVar28 = comment;
    s.events = 'event25';
    s.tl(this, 'o', 'Remove Unknown Item from Shopping List');
}
/// <summary>
/// Add Ingredient Item To Shopping List
/// </summary>
function SiteCatalyst_AddIngredientItemToShoppingList(itemId, itemType, description) 
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,eVar22,eVar24,eVar25';;
    s.linkTrackEvents = 'event47';
    s.prop22 = itemId;
    s.eVar22 = s.prop22;
    s.prop24 = itemType;
    s.eVar24 = s.prop24;
    s.prop25 = description;
    s.eVar25 = s.prop25;
    s.events = 'event47';
    s.tl(this, 'o', 'Add Ingredient Item To Shopping List');
}
/// <summary>
/// Remove Ingredient Item from Shopping List
/// </summary>
function SiteCatalyst_RemoveIngredientItemFromShoppingList(itemId, itemType, description) 
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,eVar22,eVar24,eVar25';
    s.linkTrackEvents = 'event48';
    s.prop22 = itemId;
    s.eVar22 = s.prop22;
    s.prop24 = itemType;
    s.eVar24 = s.prop24;
    s.prop25 = description;
    s.eVar25 = s.prop25;
    s.events = 'event48';
    s.tl(this, 'o', 'Remove Ingredient Item from Shopping List');
}
/// <summary>
/// Add Recipe To Shopping List
/// </summary>
function SiteCatalyst_AddRecipeToShoppingList(itemId, itemType, description) 
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,eVar22,eVar24,eVar25';;
    s.linkTrackEvents = 'event49';
    s.prop22 = itemId;
    s.eVar22 = s.prop22;
    s.prop24 = itemType;
    s.eVar24 = s.prop24;
    s.prop25 = description;
    s.eVar25 = s.prop25;
    s.events = 'event49';
    s.tl(this, 'o', 'Add Recipe To Shopping List');
}
/// <summary>
/// Remove Recipe from Shopping List
/// </summary>
function SiteCatalyst_RemoveRecipeFromShoppingList(itemId, itemType, description) 
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,eVar22,eVar24,eVar25';
    s.linkTrackEvents = 'event50';
    s.prop22 = itemId;
    s.eVar22 = s.prop22;
    s.prop24 = itemType;
    s.eVar24 = s.prop24;
    s.prop25 = description;
    s.eVar25 = s.prop25;
    s.events = 'event50';
    s.tl(this, 'o', 'Remove Recipe from Shopping List');
}
/// <summary>
/// Remove Catalog Item from Shopping List
/// </summary>
function SiteCatalyst_UpdateShoppingListQty(itemId, itemQty, itemType, description) 
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,eVar22,eVar23, eVar24,eVar25';
    s.linkTrackEvents = 'event41';
    s.prop22 = itemId;
    s.eVar22 = s.prop22;
    s.prop23 = itemQty;
    s.eVar23 = s.prop23;
    s.prop24 = itemType;
    s.eVar24 = s.prop24;
    s.prop25 = description;
    s.eVar25 = s.prop25;
    s.events = 'event41';
    s.tl(this, 'o', 'Update Shopping List Quantity');
}
/// <summary>
/// Add Multiple Coupon To Shopping List
/// </summary>
/// <param name="couponId"></param>
function SiteCatalyst_AddMultipleProductToShoppingList(shoppingList)
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,List1';
    s.linkTrackEvents = 'event42';
    s.List1 = shoppingList;
    s.events = 'event42';
    s.tl(this, 'o', 'Add Multiple Product to Shopping List');
}
/// <summary>
/// Add Shopping List Item Qty
/// </summary>
function SiteCatalyst_UpdateShoppingListWeight(itemId, itemTypeId, description, itemQty, itemWeight)
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,eVar22,eVar23,eVar24,eVar25, eVar26';
    s.linkTrackEvents = 'event44';
    s.eVar22 = itemId;
    s.eVar23 = itemQty;
    s.eVar24 = itemTypeId;
    s.eVar25 = description;
    s.eVar26 = itemWeight;
    s.events = 'event44';
    s.tl(this, 'o', 'Add Shopping List Item Qty');
}
/// <summary>
/// Remove All From Shopping List
/// </summary>
function SiteCatalyst_RemoveAllFromShoppingList(itemList, descriptionList)
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,List1, List3';
    s.linkTrackEvents = 'event45';
    s.List1 = itemList;
    s.List3 = descriptionList;
    s.events = 'event45';
    s.tl(this, 'o', 'Remove All from Shopping List');
}

/// <summary>
/// Email Shopping List
/// </summary>
function SiteCatalyst_EmailShoppingList(itemList, descriptionList)
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,List1, List3';
    s.linkTrackEvents = 'event46';
    s.List1 = itemList;
    s.List3 = descriptionList;
    s.events = 'event46';
    s.tl(this, 'o', 'Email Shopping List');
}
/// <summary>
/// Sort By Department
/// </summary>
function SiteCatalyst_HelpRequested()
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events';
    s.linkTrackEvents = 'event19';
    s.events = 'event19';
    s.tl(this, 'o', 'Help Requested');
}
/// <summary>
/// Display Circular Ad Page
/// </summary>
/// <param name="CircularId"></param>
function SiteCatalyst_DisplayCircularAdPage(CircularId) {
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,eVar18';
    s.linkTrackEvents = 'event20';
    s.events = 'event20';
    s.Prop18 = CircularId;
    s.eVar18 = s.Prop18;
    s.tl(this, 'o', 'Display Circular Ad Page');
}
/// <summary>
/// Display Circular Items By Category
/// </summary>
/// <param name="CategoryID"></param>
function SiteCatalyst_DisplayCircularItemsByCategory(CategoryID) {
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,eVar19';
    s.linkTrackEvents = 'event21';
    s.events = 'event21';
    s.Prop19 = CategoryID;
    s.eVar19 = s.Prop19;
    s.tl(this, 'o', 'Display Circular Items By Category');
}
/// <summary>
/// Display Circular Items By Brand
/// </summary>
/// <param name="brandId"></param>
function SiteCatalyst_DisplayCircularItemsByBrand(brandId) {
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,eVar1';
    s.linkTrackEvents = 'event22';
    s.events = 'event22';
    s.Prop1 = brandId;
    s.eVar1 = s.Prop1;
    s.tl(this, 'o', 'Display Circular Items By Brand');
}
/// <summary>
/// Add Circular Item To Shopping List
/// </summary>
/// <param name="keyWord"></param>
function SiteCatalyst_SearchCircularItemsByKeyWord(keyWord) {
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events,eVar7';
    s.linkTrackEvents = 'event1';
    s.prop7 = keyWord;
    s.eVar7 = s.prop7;
    s.events = 'event1';
    s.tl(this, 'o', 'Search Circular Items By KeyWord');
}
/// <summary>
/// Sign In
/// </summary>
function SiteCatalyst_SignIn(customerName)
{
    // Store it.
    mCustomerName = customerName;
    
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events, eVar27';
    s.linkTrackEvents = 'event3';
    s.prop27 = mCustomerName;
    s.eVar27 = s.prop27;
    s.events = 'event3';
    s.tl(this, 'o', 'Sign In');
}
/// <summary>
/// Sign Out
/// </summary>
function SiteCatalyst_SignOut()
{
    var s = s_gi(mSiteCatalystInfo.ReportSuiteId);
    s.linkTrackVars = 'events, eVar27';
    s.linkTrackEvents = 'event4';
    s.prop27 = mCustomerName;
    s.eVar27 = s.prop27;
    s.events = 'event4';
    s.tl(this, 'o', 'Sign Out');
    
    // Clear it.
    mCustomerName = "";
}

/**************************************************************************************************
                                            Event Handlers
 **************************************************************************************************/

/// <summary>
/// Handle Set Shopping List Item Weight Response
/// </summary>
function SiteCatalyst_SetShoppingListItemQuantityEvent(response)
{
    // Get the data
    var siteCatalystDataList = response.d;

    // Loop through the data.
    for(var index = 0; index < siteCatalystDataList.length; index++)
    {
        // get the item.
        var siteCatalystData = siteCatalystDataList[index];
        if (siteCatalystData != null)
        {
            // Get the site catalyst data.
            var itemId = siteCatalystData.itemId;
            var itemType = siteCatalystData.itemType;
            var description = siteCatalystData.description;
            var comment = siteCatalystData.comment;
            var quantity = siteCatalystData.quantity;
            var weight = siteCatalystData.weight;
            
            // Post the data to site catalyst.
            SiteCatalyst_UpdateShoppingListQty(itemId, quantity, itemType, description) 
        }
    }
}
/// <summary>
/// Add Shopping List Item With Quantity
/// </summary>
function SiteCatalyst_AddToShoppingListWithQuantityEvent(response)
{
    // Get the data
    var siteCatalystDataList = response.d;

    // Loop through the data.
    for(var index = 0; index < siteCatalystDataList.length; index++)
    {
        // get the item.
        var siteCatalystData = siteCatalystDataList[index];
        if (siteCatalystData != null)
        {
            // Get the site catalyst data.
            var itemId = siteCatalystData.itemId;
            var itemType = siteCatalystData.itemType;
            var description = siteCatalystData.description;
            var comment = siteCatalystData.comment;
            var quantity = siteCatalystData.quantity;
            var weight = siteCatalystData.weight;
            
            // Post the data to site catalyst.
            SiteCatalyst_AddItemToShoppingListByTypeId(itemId, itemType, description);
            
            // Post the data to site catalyst.
            SiteCatalyst_UpdateShoppingListQty(itemId, quantity, itemType, description) 
        }
    }
}
/// <summary>
/// Handle Set Shopping List Item Weight Response
/// </summary>
function SiteCatalyst_SetShoppingListItemWeightEvent(response)
{
     // Get the data
    var siteCatalystDataList = response.d;

    // Loop through the data.
    for(var index = 0; index < siteCatalystDataList.length; index++)
    {
        // get the item.
        var siteCatalystData = siteCatalystDataList[index];
        if (siteCatalystData != null)
        {
            // Get the site catalyst data.
            var itemId = siteCatalystData.itemId;
            var itemType = siteCatalystData.itemType;
            var description = siteCatalystData.description;
            var comment = siteCatalystData.comment;
            var quantity = siteCatalystData.quantity;
            var weight = siteCatalystData.weight;
            
            // Post the data to site catalyst.
            SiteCatalyst_UpdateShoppingListWeight(itemId, itemType, description, quantity, weight); 
        }
    }
}
/// <summary>
/// Save The Current Shopping List
/// </summary>
function SiteCatalyst_SaveTheCurrentShoppingListEvent() 
{
    // Get the coupons.
    var shoppingListCoupons = SiteCatalyst_GetAllShoppingListCouponDescriptions();
    
    // Get the items.
    var shoppingListItems = SiteCatalyst_GetAllShoppingListItemDescriptions();
    
    // concat the items
    shoppingListItems.concat(shoppingListCoupons);
    
    // Record the event
    SiteCatalyst_SaveShoppingList(shoppingListItems);
}
/// <summary>
/// Handle Site Catalyst Items Detail Success
/// </summary>
function SiteCatalyst_RemoveShoppingListItemDetailEvent(response)    
{
    // Get the data
    var siteCatalystDataList = response.d;
    
    // Loop through the data.
    for(var index = 0; index < siteCatalystDataList.length; index++)
    {
        // get the item.
        var siteCatalystData = siteCatalystDataList[index];
        if (siteCatalystData != null)
        {
            // Get the site catalyst data.
            var itemId = siteCatalystData.itemId;
            var itemType = siteCatalystData.itemType;
            var description = siteCatalystData.description;
            
            // Post the data to site catalyst.
            SiteCatalyst_RemoveItemFromShoppingListByTypeId(itemId, itemType, description);
        }
    }
}
/// <summary>
/// Handle Site Catalyst Items Detail Success
/// </summary>
function SiteCatalyst_AddShoppingListItemDetailEvent(response)    
{
    // Get the data
    var siteCatalystDataList = response.d;

    // Loop through the data.
    for(var index = 0; index < siteCatalystDataList.length; index++)
    {
        // get the item.
        var siteCatalystData = siteCatalystDataList[index];
        if (siteCatalystData != null)
        {
            // Get the site catalyst data.
            var itemId = siteCatalystData.itemId;
            var itemType = siteCatalystData.itemType;
            var description = siteCatalystData.description;
            
            // Post the data to site catalyst.
            SiteCatalyst_AddItemToShoppingListByTypeId(itemId, itemType, description);
        }
    }
}

/// <summary>
/// Get Shopping List Detail Event
/// </summary>
function SiteCatalyst_InitializeShoppingListDetailsEvent(response)    
{
    // Get the data
    var siteCatalystDataList = response.d;

    // Loop through the data.
    for(var index = 0; index < siteCatalystDataList.length; index++)
    {
        // get the item.
        var siteCatalystData = siteCatalystDataList[index];
        if (siteCatalystData != null)
        {
            // Get the site catalyst data.
            var itemId = siteCatalystData.itemId;
            var itemType = siteCatalystData.itemType;
            var description = siteCatalystData.description;
            
            // Post the data to site catalyst.
            SiteCatalyst_InsertShoppingListItem(itemId, itemType, description);
        }
    }
}
/// <summary>
/// Create Site Catalyst Shopping List Items Request
/// </summary>
function SiteCatalyst_GetShoppingListDetailsByTypeIds(typeIds, CallBackFunction)
{
    // generate the post body
    var postdata = null;
    
    // Determine if its an array
    var bisArray = Object.prototype.toString.call(typeIds) == "[object Array]";
    if (false == bisArray)
    {
        // Create the array
        var typesArray = new Array();
        
        // Add the item
        typesArray[0] = typeIds;
        typesArray[1] = -1;
        
        // Create the post data.
        postdata = {url:document.URL, requestArguments:GSNContext.RequestArguments, itemTypes:typesArray};
    }
    else
    {
        // Create the post data.
        postdata = {url:document.URL, requestArguments:GSNContext.RequestArguments, itemTypes:typeIds};
    }


    // Make the request
    $jq.ajax(
        {
            type : 'post',
            dataType: 'json',
            data: JSON.stringify(postdata),
            contentType: 'application/json; charset=utf-8',
            url : (mSiteCatalystShoppingListPageWebServiceUrl + 'GetSiteCatalystDetailsByType'),
            success: CallBackFunction
        }
    );
}

/// <summary>
/// Get Shopping List Item Details
///
/// This fails with prototype v.1.6. Needs v. 1.7
/// </summary>
function SiteCatalyst_GetShoppingListDetailsByItemIds(items, CallBackFunction)
{
    // generate the post body
    var postdata = null;
    
    // Determine if its an array
    var bisArray = Array.isArray(items);
    if (false == bisArray)
    {
        // Create the array
        var itemsArray = new Array();
        
        // Add the item
        itemsArray[0] = items;
        itemsArray[1] = -1;
        
        // Create the post data. 
        postdata = { url: document.URL, requestArguments: GSNContext.RequestArguments, itemsInput: itemsArray };
    }
    else
    {
        // Create the post data.
        postdata = {url:document.URL, requestArguments:GSNContext.RequestArguments, itemsInput:items};
    }

    // Make the request
    $jq.ajax(
        {
            type : 'post',
            dataType: 'json',
            data: JSON.stringify(postdata),
            contentType: 'application/json; charset=utf-8',
            url : (mSiteCatalystShoppingListPageWebServiceUrl + 'GetSiteCatalystItemDetails'),
            success: CallBackFunction
        }
    );
}

/**************************************************************************************************
                                            METHODS
 **************************************************************************************************/

/// <summary>
/// Initialize Shopping List
/// </summary>
function SiteCatalyst_InitializeShoppingListDetails()
{
    // generate the post body
    var postdata = {url:document.URL, requestArguments:GSNContext.RequestArguments};

    // Make the request
    $jq.ajax(
        {
            type : 'post',
            dataType: 'json',
            data: JSON.stringify(postdata),
            contentType: 'application/json; charset=utf-8',
            url : (mSiteCatalystShoppingListPageWebServiceUrl + 'GetSiteCatalystShoppingListDetails'),
            success: SiteCatalyst_InitializeShoppingListDetailsEvent
        }
    );

}
/// <summary>
/// Insert Site Catalyst Shopping List items
/// </summary>
function SiteCatalyst_InsertShoppingListItem(itemId, itemTypeId, description)
{
    // Initialize these.
    var ShoppingListItemInfo = new Object();
    
    ShoppingListItemInfo.itemId = itemId;
    ShoppingListItemInfo.itemTypeId = itemTypeId;
    ShoppingListItemInfo.description = description;
    
    // Add the new item to the list.
    mSiteCatalystShoppingListItems.push(ShoppingListItemInfo);
}
/// <summary>
/// Clear Shopping List Items
/// </summary>
function SiteCatalyst_ClearShoppingListItems()
{
    // Get all of them
    var sDescriptions = SiteCatalyst_GetAllShoppingListDescriptions();
    
    // Get all of them
    var sID = SiteCatalyst_GetAllShoppingListIds();
    
    // Record the event.
    SiteCatalyst_RemoveAllFromShoppingList(sID, sDescriptions);
    
    // Clear the array.
    mSiteCatalystShoppingListItems = [];
}
/// <summary>
/// Get coupon Item description
/// </summary>
function SiteCatalyst_GetDescriptionById(itemId)
{
    var description = new String("");
     
    // Loop through the shopping list items.
    for(var index = 0; index < mSiteCatalystShoppingListItems.length; index++)
    {
         // Get the shopping list info.
        var shoppingListItemInfo = mSiteCatalystShoppingListItems[index];
        
        //  If the info is not null, then return the description.
        if ((shoppingListItemInfo != null)
        && (shoppingListItemInfo.itemId == itemId))
        {
            description = shoppingListItemInfo.description;
        }
    }
    
    return description;
}
/// <summary>
/// Add Shopping List Item
/// </summary>
function SiteCatalyst_AddItemToShoppingList(itemId, itemTypeId, description) 
{
    // Initialize these.
    var ShoppingListItemInfo = new Object();
    
    ShoppingListItemInfo.itemId = itemId;
    ShoppingListItemInfo.itemTypeId = itemTypeId;
    ShoppingListItemInfo.description = description;
    
    // Add the new item to the list.
    mSiteCatalystShoppingListItems.push(ShoppingListItemInfo);
}
/// <summary>
/// Remove Shopping List Item
/// </summary>
function SiteCatalyst_RemoveItemFromShoppingList(itemId) 
{
    // Loop through the shopping list items.
    for(var index = 0; index < mSiteCatalystShoppingListItems.length; index++)
    {
        // Get the shopping list info.
        var shoppingListItemInfo = mSiteCatalystShoppingListItems[index];
        
        //  If the info is not null, then return the description.
        if (shoppingListItemInfo != null)
        {
            if (shoppingListItemInfo.itemId == itemId)
            {
                // Remove the item
                mSiteCatalystShoppingListItems.splice(index, 1);
            
                // Success
                return 1;
            }
        }
    }
   
    return 0;
}
/// <summary>
/// Get all shopping list Id
/// </summary>
function SiteCatalyst_GetAllShoppingListDescriptions() 
{
    // Declare the string.
    var ShoppingListDesc = new String("");
    var sDescription = new String("");
    
    for (var index=0; index < mSiteCatalystShoppingListItems.length; index++)
    {
         // Get the shopping list info.
        var shoppingListItemInfo = mSiteCatalystShoppingListItems[index];
        if (shoppingListItemInfo != null)
        {
            sDescription = shoppingListItemInfo.description;
        }
        
        // Make sure that there is actually a value.
        if (sDescription.length > 0)
        {
            if (ShoppingListDesc.length > 0)
            {
                ShoppingListDesc = ShoppingListDesc + ",";
            }
            ShoppingListDesc = ShoppingListDesc + sDescription;
        }
    }
    
    return ShoppingListDesc;
}
/// <summary>
/// Get all shopping list Id
/// </summary>
function SiteCatalyst_GetAllShoppingListIds() 
{
    // Declare the string.
    var ShoppingListID = new String("");
    var sItemId = new String("");
    
    for (var index=0; index < mSiteCatalystShoppingListItems.length; index++)
    {
        var shoppingListItemInfo = mSiteCatalystShoppingListItems[index];
        if (shoppingListItemInfo != null)
        {
            sItemId = shoppingListItemInfo.itemId;
        }
        
        // Make sure that there is actually a value.
        if (sItemId.length > 0)
        {
            if (ShoppingListID.length > 0)
            {
                ShoppingListID = ShoppingListID + ",";
            }
            ShoppingListID = ShoppingListID + sItemId;
        }
    }
    
    return ShoppingListID;
}
/// <summary>
/// Get Shopping List Items
/// </summary>
function SiteCatalyst_GetAllShoppingListCouponDescriptions() 
{
       // Declare the string.
    var ShoppingListItems = new String("");
    var sItemId = new String("");
    
    // Loop through the array
    for (var index=0; index < mSiteCatalystShoppingListItems.length; index++)
    {
        var shoppingListItemInfo = mSiteCatalystShoppingListItems[index];
        if (shoppingListItemInfo != null)
        {
            if ((shoppingListItemInfo.itemTypeId == 2) 
            || (shoppingListItemInfo.itemTypeId == 9) 
            || (shoppingListItemInfo.itemTypeId == 10) 
            || (shoppingListItemInfo.itemTypeId == 13))
            {
                sDescription = shoppingListItemInfo.description;
                if ((sDescription != null) 
                && (sDescription.length > 0))
                {
                    if (ShoppingListItems.length > 0)
                    {
                        ShoppingListItems = ShoppingListItems + ",";
                    }
                    ShoppingListItems = ShoppingListItems + sDescription;
                }
            }
        }
    }
    
    return ShoppingListItems;
}
/// <summary>
/// Get Shopping List Items As String
/// </summary>
function SiteCatalyst_GetAllShoppingListItemDescriptions() 
{
    // Declare the string.
    var ShoppingListItems = new String("");
    var sItemId = new String("");
    
    // Loop through the array
    for (var index=0; index < mSiteCatalystShoppingListItems.length; index++)
    {
        var shoppingListItemInfo = mSiteCatalystShoppingListItems[index];
        if (shoppingListItemInfo != null)
        {
            if ((shoppingListItemInfo.itemTypeId != 2) 
            && (shoppingListItemInfo.itemTypeId != 9) 
            && (shoppingListItemInfo.itemTypeId != 10) 
            && (shoppingListItemInfo.itemTypeId != 13))
            {
                sDescription = shoppingListItemInfo.description;
                if ((sDescription != null) 
                && (sDescription.length > 0))
                {
                    if (ShoppingListItems.length > 0)
                    {
                        ShoppingListItems = ShoppingListItems + ",";
                    }
                    ShoppingListItems = ShoppingListItems + sDescription;
                }
            }
        }
    }
    
    return ShoppingListItems;
}
/// <summary>
/// Get Product Description From Query String
/// </summary>
function SiteCatalyst_GetProductDescriptionFromQueryString(queryString, fieldName)
{
    var returnString = "";
    
    var splitString = queryString.split("~");
    if (splitString.length > 0)
    {
        for( var index = 0; index < splitString.length; index++)
        {
            var indexOf = splitString[index].indexOf(fieldName);
            if ( indexOf != -1 )
            {
                returnString = splitString[index].split("=")[1];
            }
        }
    }
    
    return returnString;
}
/// <summary>
/// Handle Get Shopping List Id
/// </summary>
function SiteCatalyst_RemoveItemFromShoppingListByTypeId(itemID, itemTypeID, description)
{
    // Success flag
    var iSuccess = SiteCatalyst_RemoveItemFromShoppingList(itemID);
    
    // Coupons
    if ((itemTypeID == 2) 
    || (itemTypeID == 9) 
    || (itemTypeID == 10) 
    || (itemTypeID == 13))
    {
        // Add the shopping list coupon
        if (iSuccess == 1)
        {
            // Record the item being added to the shopping list.
            SiteCatalyst_RemoveCouponFromShoppingList(itemID, itemTypeID, description);
        }
    }
    else
    {
        if (iSuccess == 1)
        {
            // Category
            if (itemTypeID == 1)
            {
                // Add the product to the shopping list
                SiteCatalyst_RemoveCategoryFromShoppingList(itemID, itemTypeID, description);
            } // Product
            else if (itemTypeID == 3)
            {
                // Add the product to the shopping list
                SiteCatalyst_RemoveProductFromShoppingList(itemID, itemTypeID, description);
            } // Recipe
            else if (itemTypeID == 4)
            {
                SiteCatalyst_RemoveRecipeFromShoppingList(itemID, itemTypeID, description);
            
            } // Recipe Ingredient
            else if (itemTypeID == 5)
            {
                SiteCatalyst_RemoveIngredientItemFromShoppingList(itemID, itemTypeID, description);
                
            } // Own Items.
            else if (itemTypeID == 6) 
            {
                // Record that we removed it from the list
                SiteCatalyst_RemoveYourOwnFromShoppingList(itemID, itemTypeID, description);
            } // Ad Pod.
            else if (itemTypeID == 7)
            {
                // Record that we Added it the list
                SiteCatalyst_RemoveAdPodFromShoppingList(itemID, itemTypeID, description);
            } // Add the circular item
            else if (itemTypeID == 8)
            {
                // Add the circular
                SiteCatalyst_RemoveCircularItemFromShoppingList(itemID, itemTypeID, description);
            }
            else if (itemTypeID == 11)
            {
                // Add the catalog
                SiteCatalyst_RemoveCatalogItemFromShoppingList(itemID, itemTypeID, description);
            }
        }
    }
}
/// <summary>
/// Handle Get Shopping List Id
/// </summary>
function SiteCatalyst_AddItemToShoppingListByTypeId(itemID, itemTypeID, description)
{
    // Add it to the list.
    SiteCatalyst_AddItemToShoppingList(itemID, itemTypeID, description);
    
    // Coupons
    if ((itemTypeID == 2) 
    || (itemTypeID == 9) 
    || (itemTypeID == 10) 
    || (itemTypeID == 13))
    {
        if (itemTypeID == 2)
        {
            SiteCatalyst_AddManufacturerCouponToShoppingList(itemID, itemTypeID, description);
        }
        else if (itemTypeID == 9) 
        {
            SiteCatalyst_AddFeaturedProductCouponToShoppingList(itemID, itemTypeID, description);
        }
        else if (itemTypeID == 10) 
        {
            SiteCatalyst_AddStoreCouponToShoppingList(itemID, itemTypeID, description);
        }
        else if (itemTypeID == 13) 
        {
            SiteCatalyst_AddYouTechCouponToShoppingList(itemID, itemTypeID, description);
        }
    }
    else
    {
        // Category
        if (itemTypeID == 1)
        {
            // Add the product to the shopping list
            SiteCatalyst_AddCategoryToShoppingList(itemID, itemTypeID, description);

        } // Product
        else if (itemTypeID == 3)
        {
            // Add the product to the shopping list
            SiteCatalyst_AddProductToShoppingList(itemID, itemTypeID, description);
        
        } // Recipe
        else if (itemTypeID == 4)
        {
            SiteCatalyst_AddRecipeToShoppingList(itemID, itemTypeID, description);
  
        } // Recipe Ingredient
        else if (itemTypeID == 5)
        {
            SiteCatalyst_AddIngredientItemToShoppingList(itemID, itemTypeID, description);

        } // Own Items.
        else if (itemTypeID == 6) 
        {
            // Record that we removed it from the list
            SiteCatalyst_AddYourOwnToShoppingList(itemID, itemTypeID, description);
            
        } // Ad Pod.
        else if (itemTypeID == 7)
        {
            // Record that we Added it the list
            SiteCatalyst_AddAdPodToShoppingList(itemID, itemTypeID, description);
        
        } // Add the circular item
        else if (itemTypeID == 8)
        {
            // Add the circular
            SiteCatalyst_AddCircularItemToShoppingList(itemID, itemTypeID, description);
        }
        else if (itemTypeID == 11)
        {
            // Add the catalog
            SiteCatalyst_AddCatalogItemToShoppingList(itemID, itemTypeID, description);
        }
    }
}