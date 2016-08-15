function addPromotion(ProductCode, isProprietary){
    var arguments = ProductCode + ',' + isProprietary;
    __doPostBack('AdPage', arguments);
  }