<script type="text/javascript">
    $(document).ready(function(){
        var catelogId = ${modifiedThing.cid};
        var placeId = ${modifiedThing.taddress};
        var timeId = ${modifiedThing.ttime};
        alert(catelogId);
        alert(placeId);
        alert(timeId);
        //根据值让option选中
        $("#category option[value='"+catelogId+"']").attr("selected","selected");
        $("#place option[value='"+placeId+"']").attr("selected","selected");
        $("#time option[value='"+timeId+"']").attr("selected","selected");
    });
</script>