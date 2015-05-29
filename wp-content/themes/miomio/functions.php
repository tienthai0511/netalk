<?php
define('TALK_PATH_URL', get_template_directory_uri()); // logical location for LF framework
define('DEFAUL_THUMNAIL', TALK_PATH_URL . '/img/default-thumbnail.jpg');
define('EXCERPT_LENGTH', 28);
/*
*Add ReduxFramework.
*/
if ( !class_exists( 'ReduxFramework' ) && file_exists( dirname( __FILE__ ) . '/framework/ReduxCore/framework.php' ) ) {
    require_once( dirname( __FILE__ ) . '/framework/ReduxCore/framework.php' );
}
if ( !isset( $redux_demo ) && file_exists( dirname( __FILE__ ) . '/framework/sample/barebones-config.php' ) ) {
    require_once( dirname( __FILE__ ) . '/framework/sample/barebones-config.php' );
}

function custom_excerpt_length( $length ) {
    return EXCERPT_LENGTH;
}
add_filter( 'excerpt_length', 'custom_excerpt_length', 999 );

/**
 * Set title for page
 */
function support_wp_title( $title, $sep ) {
    global $paged, $page, $wp_query;
    $blog_title = get_bloginfo( 'name', 'display' );
    $term = $wp_query->get_queried_object();
    if ( is_feed() )
        return $title;


    //check title tag/taxonomy
    /*if( $term->name != '') {
        $term = $wp_query->get_queried_object();
        $title = $term->name;
        return $title . '|' . $blog_title;
    }*/
    if (is_search() ) {
        return $title = get_search_query() . '|' . $blog_title;
    }
    // Add the site name.
    $title .= $blog_title;

    // Add the site description for the home/front page.
    $site_description = get_bloginfo( 'description', 'display' );
    if ( $site_description && ( is_home() || is_front_page() ) )
        $title = "$title $sep $site_description";
    return $title;
}
add_filter( 'wp_title', 'support_wp_title', 10, 2 );

/**
 *Enqueue Scripts and Styles.
 */
function miomio_scripts() {
    wp_enqueue_style( 'foundation-css', get_template_directory_uri() . '/css/foundation.css', array(), '', false );
    wp_enqueue_style( 'main-style', get_stylesheet_uri() );
    wp_enqueue_style( 'custom-style', get_template_directory_uri() . '/css/custom-style.css', array(), '', false );
    wp_enqueue_style( 'portfolio', get_template_directory_uri() . '/css/portfolio.css', array(), '', false );
    wp_enqueue_script( 'modernizr', get_template_directory_uri() . '/js/vendor/modernizr.js', array(), '', false );

    wp_enqueue_script( 'jquery' );
    wp_enqueue_script( 'foundation-js', get_template_directory_uri() . '/js/foundation.min.js', array(), '', true );
    wp_enqueue_script( 'main', get_template_directory_uri() . '/js/main.js', array(), '', true );
}

add_action( 'wp_enqueue_scripts', 'miomio_scripts' );

function miomio_setup(){

     /*
     *Languages Textdomain.
     */
    load_theme_textdomain('miomio', get_template_directory() . '/languages');

    /*
     * Switch default core markup for search form, comment form, and comments
     * to output valid HTML5.
     */
    add_theme_support( 'html5', array(
        'search-form', 'comment-form', 'comment-list', 'gallery', 'caption'
    ) );

    /*
    *Support for Post Thumbnails.
    */
    add_theme_support( 'post-thumbnails' );
    add_image_size('blog', 325, 260, true);
    add_image_size('single-page', 823, 400, true);
    add_image_size('project', 276, 207, true);
    add_image_size('single-project', 476, 357, true);
    /*
    *Require inc
    */
    require get_template_directory() . '/inc/widgets.php';
    require get_template_directory() . '/inc/shortcode.php';

}
add_action('after_setup_theme', 'miomio_setup');

/**
 * Show admin messages
 *
 */
function show_admin_messages()
{
    $plugin_messages = array();

    include_once( ABSPATH . 'wp-admin/includes/plugin.php' );

    // Download the Contact Form 7
    if(!is_plugin_active( 'contact-form-7/wp-contact-form-7.php' ))
    {
        $plugin_messages[] = 'This theme requires you to install the Contact Form 7 plugin, <a href="https://wordpress.org/plugins/contact-form-7/">download it from here</a>.';
    }

    if(count($plugin_messages) > 0)
    {
        echo '<div id="message" class="error">';
        echo '<h3><strong>For full theme functionality you must install the following plugins.</strong></h3>';
            foreach($plugin_messages as $message)
            {
                echo '<p><strong>'.$message.'</strong></p>';
            }

        echo '</div>';
    }
}
add_action('admin_notices', 'show_admin_messages');

/**
 * Register Nav Menus.
 *
 */
function register_my_menus() {
    register_nav_menus(
        array(
            'main-menu' => __( 'Main Menu', 'miomio' ),
            'footer-menu' => __( 'Footer Menu', 'miomio' ),
        )
    );
}
add_action( 'init', 'register_my_menus' );


/**
 * Register Sidebars. 
 *
 */
function miomio_widgets_init() {

    register_sidebar( array(
        'name' => 'right sidebar',
        'id' => 'right_sidebar',
        'before_widget' => '<div class="side-item">',
        'after_widget' => '</div>',
        'before_title' => '<h3>',
        'after_title' => '</h3>',
    ) );
}
add_action( 'widgets_init', 'miomio_widgets_init' );

/**
 * Excerpt New Theme.
 *
 */
function miomio_excerpt_more( $text ) {
    $text = '...';
    return $text;
}
add_filter( 'excerpt_more', 'miomio_excerpt_more' );

/**
 * Excerpt New Length.
 *
 */
function miomio_new_excerpt_length($length) {
    return 40;
}
add_filter('excerpt_length', 'miomio_new_excerpt_length');

/**
 * Footer Text. (remove framework copyright)
 *
 */
function miomio_footer_edit()
{
    add_filter( 'admin_footer_text', 'miomio_footer_text', 11 );
}
function miomio_footer_text($content) {
    return "Thank you for creating with <a href=\"https://wordpress.org/\">WordPress</a>.";
}
add_action( 'admin_init', 'miomio_footer_edit' );

/**
 * Menu Active.
 *
 */
add_filter('nav_menu_css_class' , 'special_nav_class' , 10 , 2);
function special_nav_class($classes, $item){
    if( in_array('current-menu-item', $classes) ){
        $classes[] = 'active';
    }
    return $classes;
}

/**
 * Customize submenu output
 */
class top_bar_walker extends Walker_Nav_Menu {
 
    function display_element( $element, &$children_elements, $max_depth, $depth=0, $args, &$output ) {
        $element->has_children = !empty( $children_elements[$element->ID] );
        $element->classes[] = ( $element->current || $element->current_item_ancestor ) ? 'active' : '';
        $element->classes[] = ( $element->has_children ) ? 'has-dropdown' : '';
        
        parent::display_element( $element, $children_elements, $max_depth, $depth, $args, $output );
    }
    
    function start_el( &$output, $object, $depth = 0, $args = array(), $current_object_id = 0 ) {
        $item_html = '';
        parent::start_el( $item_html, $object, $depth, $args ); 
        
        $classes = empty( $object->classes ) ? array() : (array) $object->classes;  
        
        if( in_array('label', $classes) ) {
            $item_html = preg_replace( '/<a[^>]*>(.*)<\/a>/iU', '<label>$1</label>', $item_html );
        }
        
    if ( in_array('divider', $classes) ) {
        $item_html = preg_replace( '/<a[^>]*>( .* )<\/a>/iU', '', $item_html );
    }
        
        $output .= $item_html;
    }
    
    function start_lvl( &$output, $depth = 0, $args = array() ) {
        $output .= "\n<ul class=\"sub-menu dropdown\">\n";
    }
    
}

/**
 * Pagination Number
 */
if ( ! function_exists( 'my_pagination' ) ) :
    function my_pagination() {
        global $wp_query;

        $big = 999999999; // need an unlikely integer
        
        echo paginate_links( array(
            'base' => str_replace( $big, '%#%', esc_url( get_pagenum_link( $big ) ) ),
            'format' => '?paged=%#%',
            'current' => max( 1, get_query_var('paged') ),
            'total' => $wp_query->max_num_pages
        ) );
    }
endif;

/**
 * Project post type
 */
add_action( 'init', 'codex_project_init' );
/**
 * Register a Project post type.
 *
 * @link http://codex.wordpress.org/Function_Reference/register_post_type
 */
function codex_project_init() {
    $labels = array(
        'name'               => _x( 'Projects', 'post type general name', 'your-plugin-textdomain' ),
        'singular_name'      => _x( 'Project', 'post type singular name', 'your-plugin-textdomain' ),
        'menu_name'          => _x( 'Projects', 'admin menu', 'your-plugin-textdomain' ),
        'name_admin_bar'     => _x( 'Project', 'add new on admin bar', 'your-plugin-textdomain' ),
        'add_new'            => _x( 'Add New', 'project', 'your-plugin-textdomain' ),
        'add_new_item'       => __( 'Add New Project', 'your-plugin-textdomain' ),
        'new_item'           => __( 'New Project', 'your-plugin-textdomain' ),
        'edit_item'          => __( 'Edit Project', 'your-plugin-textdomain' ),
        'view_item'          => __( 'View Project', 'your-plugin-textdomain' ),
        'all_items'          => __( 'All Projects', 'your-plugin-textdomain' ),
        'search_items'       => __( 'Search projects', 'your-plugin-textdomain' ),
        'parent_item_colon'  => __( 'Parent projects:', 'your-plugin-textdomain' ),
        'not_found'          => __( 'No Projects found.', 'your-plugin-textdomain' ),
        'not_found_in_trash' => __( 'No Projects found in Trash.', 'your-plugin-textdomain' )
    );

    $args = array(
        'labels'             => $labels,
        'public'             => true,
        'publicly_queryable' => true,
        'show_ui'            => true,
        'show_in_menu'       => true,
        'query_var'          => true,
        'rewrite'            => array( 'slug' => 'project' ),
        'capability_type'    => 'post',
        'has_archive'        => true,
        'hierarchical'       => false,
        'menu_position'      => null,
        'supports'           => array( 'title', 'editor', 'author', 'thumbnail', 'excerpt', 'comments' ),
        'menu_icon'          => 'dashicons-welcome-widgets-menus'
    );

    register_post_type( 'project', $args );
}

add_action( 'init', 'create_portfolio_tax' );

function create_portfolio_tax() {
    register_taxonomy(
        'type',
        'project',
        array(
            'label' => __( 'Type' ),
            'rewrite' => array( 'slug' => 'type' ),
            'hierarchical' => true,
        )
    );
}

/**
 * Project meta boxes
 */
add_action('add_meta_boxes', 'meta_boxes');

function meta_boxes(){
    add_meta_box(
        'portfolio-link',
        'Portfolio Link',
        'portfolio_link',
        'project',
        'side'
    );

    add_meta_box(
        'project-skills',
        'Project Skills',
        'project_skills',
        'project',
        'side'
    );

    add_meta_box(
        'featured-post',
        'Featured Post',
        'featured_post',
        'post',
        'side'
    );     
}

function portfolio_link($post){
    wp_nonce_field( 'portfolio_link_meta_box', 'portfolio_link_meta_box_nonce' );

    $link = get_post_meta($post->ID, 'portfolio_link', true);

    ?>
        <label for="portfolio_link">Link: </label>
        <input class="widefat" type="text" name="portfolio_link" id="portfolio_link" value="<?php echo esc_attr($link) ?>">
    <?php
}

add_action('save_post' , 'save_link');

function save_link($post_id){
    if ( ! isset( $_POST['portfolio_link_meta_box_nonce'] ) ) {
        return;
    }

    // Verify that the nonce is valid.
    if ( ! wp_verify_nonce( $_POST['portfolio_link_meta_box_nonce'], 'portfolio_link_meta_box' ) ) {
        return;
    }

    // If this is an autosave, our form has not been submitted, so we don't want to do anything.
    if ( defined( 'DOING_AUTOSAVE' ) && DOING_AUTOSAVE ) {
        return;
    }

    if(isset($_POST['portfolio_link'])){
        update_post_meta($post_id, 'portfolio_link', $_POST['portfolio_link']);
    }
}


function project_skills($post){
    wp_nonce_field( 'project_skills_meta_box', 'project_skills_meta_box_nonce' );

    $link = get_post_meta($post->ID, 'project_skills', true);

    ?>
        <label for="project_skills">Project Skills: </label>
        <input class="widefat" type="text" name="project_skills" id="project_skills" value="<?php echo esc_attr($link) ?>">
    <?php
}

add_action('save_post' , 'save_skills');

function save_skills($post_id){
    if ( ! isset( $_POST['project_skills_meta_box_nonce'] ) ) {
        return;
    }

    // Verify that the nonce is valid.
    if ( ! wp_verify_nonce( $_POST['project_skills_meta_box_nonce'], 'project_skills_meta_box' ) ) {
        return;
    }

    // If this is an autosave, our form has not been submitted, so we don't want to do anything.
    if ( defined( 'DOING_AUTOSAVE' ) && DOING_AUTOSAVE ) {
        return;
    }

    if(isset($_POST['project_skills'])){
        update_post_meta($post_id, 'project_skills', $_POST['project_skills']);
    }
}


function featured_post($post){
    wp_nonce_field( 'featured_post_meta_box', 'featured_post_meta_box_nonce' );

    $featured = get_post_meta($post->ID, 'featured_post', true);

    ?>
        <label for="featured_post">Featured: </label>
        <input type="checkbox" name="featured_post" id="featured_post" <?php echo $featured ? 'checked="checked"' : '' ?>>
    <?php
}

add_action('save_post' , 'save_featured');

function save_featured($post_id){
    if ( ! isset( $_POST['featured_post_meta_box_nonce'] ) ) {
        return;
    }

    // Verify that the nonce is valid.
    if ( ! wp_verify_nonce( $_POST['featured_post_meta_box_nonce'], 'featured_post_meta_box' ) ) {
        return;
    }

    // If this is an autosave, our form has not been submitted, so we don't want to do anything.
    if ( defined( 'DOING_AUTOSAVE' ) && DOING_AUTOSAVE ) {
        return;
    }

    if(isset($_POST['featured_post'])){
        update_post_meta($post_id, 'featured_post', 1);
    }
    else{
        update_post_meta($post_id, 'featured_post', 0);
    }
}

/*
 * Add style for admin page
 */
add_action('admin_enqueue_scripts', 'admin_load_js_and_css');
function admin_load_js_and_css() {
	// select2
	wp_register_style('select2.css', TALK_PATH_URL . '/js/select2-3.5.1/select2.css' );
	wp_enqueue_style('select2.css');
	wp_register_script('select2.js', TALK_PATH_URL . '/js/select2-3.5.1/select2.min.js');
	wp_enqueue_script('select2.js');
	wp_register_script('locale_ja.js', TALK_PATH_URL . '/js/select2-3.5.1/select2_locale_ja.js');
	wp_enqueue_script('locale_ja.js');
}

add_action( 'add_meta_boxes', 'add_events_metaboxes' );
function add_events_metaboxes() {
    add_meta_box('wpt_events_related_post', __('Related FAQ', 'talk'), 'wpt_events_related_post', 'post', 'normal', 'default');
}

/*
 * Add meta box selected related post
 */

function wpt_events_related_post($post) {
    global $post;

    //Noncename needed to verify where the data originated
    echo '<input type="hidden" name="eventmeta_noncename" id="eventmeta_noncename" value="' . wp_create_nonce( plugin_basename(__FILE__) ) . '" />';

    $data = array();
    if ($post->ID) {
        $data = get_post_meta($post->ID, 'related_posts_post', FALSE);
    }
    if (!empty($data[0] ))
    $data = explode(',', $data[0]);

    //get list faq
    $args = array(
        'post_type' => 'post',
        'post_status' => array('publish'),
        'orderby' => 'title',
        'post__not_in' => array($post->ID)
    );

    $html = '';
    $the_query = new WP_Query( $args );
    while ($the_query ->have_posts()) {
        $the_query ->the_post();
        $_title = get_the_title();
        $_id = get_the_ID();
        $_selected = (count($data) > 0 && in_array($_id, $data)) ? "selected" : '';
        $html .= "<option {$_selected} value=\"{$_id}\">{$_title}</option>";
    }
    echo <<<SELECT
    <select style="width:100%" name="related_posts_post[]" id="related_posts_post" multiple="multiple">
        {$html}
    </select>
SELECT;
    echo <<<EOT
    <script type="text/javascript">
        jQuery('#related_posts_post').select2({
            closeOnSelect : false,
            allowClear: true,
        });
    </script>
EOT;
}

// save meta box
/*
 * Save the Metabox Data
 */
add_action('save_post', 'wpt_save_related_post_meta', 1, 2);
function wpt_save_related_post_meta($post_id, $post) {

    // verify this came from the our screen and with proper authorization,
    // because save_post can be triggered at other times
    if ( !wp_verify_nonce( $_POST['eventmeta_noncename'], plugin_basename(__FILE__) )) {
        return $post->ID;
    }

    // Is the user allowed to edit the post or page?
    if ( !current_user_can( 'edit_post', $post->ID ))
        return $post->ID;

    // OK, we're authenticated: we need to find and save the data
    // We'll put it into an array to make it easier to loop though.

    $events_meta['related_posts_post'] = $_POST['related_posts_post'];
    
    // Add values of $events_meta as custom fields

    foreach ($events_meta as $key => $value) {
        // Don't store custom data twice
        if( $post->post_type == 'revision' ) return;

        $value = implode(',', (array)$value);

        // If the custom field already has a value
        if(get_post_meta($post->ID, $key, FALSE)) {
            update_post_meta($post->ID, $key, $value);
        }
        // If the custom field doesn't have a value
        else {
            add_post_meta($post->ID, $key, $value);
        }

        // Delete if blank
        if(!$value) delete_post_meta($post->ID, $key);
    }
}
