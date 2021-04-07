function init() {
    goPage(1,10);
    var str = "";
    for(var i = 1;i<totalPages+1;i++){

        str+="<option value="+i+">"+i+"</option>"

    }
    $("#jumpWhere").html(str);
}


var pageSize_ = 0;
var currentPage_ = 1; //设置全局变量，用于跳转时判断是否在同一页，在就不跳转
var totalPages;
function goPage(page,pageSize) {
    //获取tbody
    var tbody = document.getElementById("adminTbody");
    //获取总行数
    var num = tbody.rows.length;
    //获取总页数
    if(num/pageSize>parseInt(num/pageSize)){
        totalPages = parseInt(num/pageSize)+1;
    }else{
        totalPages = num/pageSize;
    }

    var startRow = (page-1)*pageSize+1;
    var endRow = page*pageSize;
    endRow = (endRow>num)?num:endRow;

    $("#adminTbody tr").hide();
    for(var i = startRow-1;i<endRow;i++){
        $("#adminTbody tr").eq(i).show();  //从零开始数
    }

    //赋值于全局变量
    currentPage_ = page;
    pageSize_ = pageSize;

    //提示几条记录在几页共几页
    var tempStr = "有"+num+"条记录 当前在第"+page+"页共"+totalPages+"页";
    //存入barcon1
    $("#barcon1").html(tempStr);

    //到首页后，首页和前一页按钮不能点击并变微透明
    if(page>1){
        $("#firstPage").on("click",function(){//首页
            goPage(1,pageSize);
        }).removeClass("ban");
        $("#prePage").on("click",function(){//上一页
            goPage(page-1,pageSize);
        }).removeClass("ban");
    }else{
        $("#firstPage").off("click").addClass("ban");
        $("#prePage").off("click").addClass("ban");
    }

    //到尾页后，尾页、后一页按钮不能点击并变微透明
    if(page<totalPages){
        $("#lastPage").on("click",function(){//尾页
            goPage(totalPages,pageSize);
        }).removeClass("ban");
        $("#nextPage").on("click",function () {//下一页
            goPage(page+1,pageSize);
        }).removeClass("ban");
    }else{
        $("#lastPage").off("click").addClass("ban");
        $("#nextPage").off("click").addClass("ban");
    }


    //给拉下框赋值
    $("#jumpWhere").val(page);

}

function jumpPage() {
    //如果跳转的页数和本页相同，就不跳转
    var pno = $("#jumpWhere").val();
    if(pno!=currentPage_){
        goPage(pno,pageSize_);
    }

}
