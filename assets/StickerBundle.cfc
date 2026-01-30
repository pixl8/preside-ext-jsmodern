/**
 * Preside Extension StickerBundle - JS Modern
 *
 * This extension overrides the core Preside Sticker bundle to replace
 * jQuery and Bootstrap with modern alternatives:
 *
 * - jQuery 2.x    -> JQNext   (jQuery 2.x API compatible, modern internals)
 * - Bootstrap 3.x -> SandalJS (Bootstrap 3 API compatible, powered by JQNext)
 *
 * JQNext provides full jQuery 2.x API compatibility including jQuery UI 1.11.x support.
 * SandalJS provides Bootstrap 3 JavaScript component compatibility.
 *
 * By using the same Sticker IDs as core Preside, these assets will override
 * the originals when this extension is loaded.
 */
component output=false {

	public void function configure( bundle ) {

		// OVERRIDE CORE ASSETS WITH MODERN REPLACEMENTS
		// Using same IDs as core Preside to override them

		// JQNext replaces jQuery 2.x (same API, modern internals)
		bundle.addAsset( id="/js/admin/lib/jquery/"    , path="/js/admin/lib/jqnext*.min.js" );

		// SandalJS replaces Bootstrap 3.x JavaScript (same API, powered by JQNext)
		bundle.addAsset( id="/js/admin/lib/bootstrap/" , path="/js/admin/lib/sandal*.min.js" );

		// DEFINE DEPENDENCIES
		// SandalJS depends on JQNext for jQuery compatibility
		bundle.asset( "/js/admin/lib/bootstrap/" ).dependsOn( "/js/admin/lib/jquery/" );

		// Additional extension assets (using standard Preside naming convention)
		bundle.addAssets(
			  directory   = "/js"
			, match       = function( path ){ return ReFindNoCase( "_[0-9a-f]{8}\..*?\.min.js$", arguments.path ); }
			, idGenerator = function( path ) {
				return ListDeleteAt( path, ListLen( path, "/" ), "/" ) & "/";
			}
		);

		bundle.addAssets(
			  directory   = "/css"
			, match       = function( path ){ return ReFindNoCase( "_[0-9a-f]{8}\..*?\.min.css$", arguments.path ); }
			, idGenerator = function( path ) {
				return ListDeleteAt( path, ListLen( path, "/" ), "/" ) & "/";
			}
		);

	}

}
