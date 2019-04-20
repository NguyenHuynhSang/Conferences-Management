/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	config.language = 'vi';
    // config.uiColor = '#AADC6E';
    //config.extraPlugins = 'syntaxhighlight';
    ////config.syntaxhighlight_lang = 'csharp';
    ////config.syntaxhighlight_hideControls = true;
    config.filebrowserBrowseUrl = '/Assets/Admin/js/Plugins/ckfinder/ckfinder.html';
    config.filebrowserImageBrowseUrl = '/Assets/Admin/js/Plugins/ckfinder/ckfinder.html?Type=Images';
    config.filebrowserFlashBrowseUrl = '/Assets/Admin/js/Plugins/ckfinder/ckfinder.html?Type=Flash';
    config.filebrowserUploadUrl = '/Assets/Admin/js/Plugins/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Files';
    config.filebrowserImageUploadUrl = '/Data';
    config.filebrowserFlashUploadUrl = '/Assets/Admin/js/Plugins/ckfinder/core/connector/aspx/conector.aspx?command=QuickUpload&type=Flash';

    CKFinder.setupCKEditor(null,'/Assets/Admin/js/Plugins/ckfinder/')

};
