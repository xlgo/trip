function useraddPhotoUploadSuccess(file, data, response){
	var $userPhotoImg = $("#useraddPhoto");
	$userPhotoImg.attr("src",$userPhotoImg.attr("baseScr")+$.parseJSON(data).id);
}
function usereditPhotoUploadSuccess(file, data, response){
	var $userPhotoImg = $("#usereditPhoto");
	$userPhotoImg.attr("src",$userPhotoImg.attr("baseScr")+$.parseJSON(data).id);
}

function userPhotoQueueComplete(queueData){
}

function articleaddPhotoUploadSuccess(file, data, response){
	var $userPhotoImg = $("#articleaddPhoto");
	$userPhotoImg.attr("src",$userPhotoImg.attr("baseScr")+$.parseJSON(data).id);
}
function articleeditPhotoUploadSuccess(file, data, response){
	var $userPhotoImg = $("#articleeditPhoto");
	$userPhotoImg.attr("src",$userPhotoImg.attr("baseScr")+$.parseJSON(data).id);
}

function articlePhotoQueueComplete(queueData){
}

function userExtUploadSuccess(file, data, response){
	var respData = $.parseJSON(data);
	var $temple = $(".photoExt .temple").clone(true);
	var $img = $temple.removeAttr("class").removeAttr("style").find(".rem").data("id",respData.id).next();
	$img.attr({title:respData.name,src:$img.attr("baseScr")+respData.id}).removeAttr("baseSrc");
	$temple.prependTo($(".photoExt"));
}
function userExtQueueComplete(){
	
}