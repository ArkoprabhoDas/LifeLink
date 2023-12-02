function _(id){
    return document.getElementById(id);
}

window.addEventListener('load', function(){
    var uploader = document.createElement('input'),
        image = _('img-result');

    uploader.type = 'file';
    uploader.accept = 'image/*';

    image.onclick = function() {
        uploader.click();
    }

    uploader.onchange = function() {
        var reader = new FileReader();
        reader.onload = function(evt) {
            image.classList.remove('no-image');
            image.style.backgroundImage = 'url(' + evt.target.result + ')';
            var request = {
                itemtype: 'test 1',
                brand: 'test 2',
                images: [{
                    data: evt.target.result
                }]
            };
         
            _('wrapper').classList.add('hasImage');
            _('filename').value = uploader.files[0].name;
            document.querySelector('.upload-result__content').innerHTML = JSON.stringify(request, null, '  ');
        }
        reader.readAsDataURL(uploader.files[0]);
    }
    
    document.querySelector('.hide-button').onclick = function () {
        document.querySelector('.upload-result').style.display = 'none';
    };
    
    _('container').addEventListener('click', function (e){
        if(this.classList.contains('container-upload-collapsed'))
            this.classList.toggle('container-upload-collapsed');
        else if(e.target.id == 'closebtn')
            this.classList.toggle('container-upload-collapsed');
    });
});