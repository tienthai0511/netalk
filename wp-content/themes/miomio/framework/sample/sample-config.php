<?php

/**
  ReduxFramework Sample Config File
  For full documentation, please visit: https://docs.reduxframework.com
 * */

if (!class_exists('Redux_Framework_sample_config')) {

    class Redux_Framework_sample_config {

        public $args        = array();
        public $sections    = array();
        public $theme;
        public $ReduxFramework;

        public function __construct() {

            if (!class_exists('ReduxFramework')) {
                return;
            }

            // This is needed. Bah WordPress bugs.  ;)
            if (  true == Redux_Helpers::isTheme(__FILE__) ) {
                $this->initSettings();
            } else {
                add_action('plugins_loaded', array($this, 'initSettings'), 10);
            }

        }

        public function initSettings() {

            // Just for demo purposes. Not needed per say.
            $this->theme = wp_get_theme();

            // Set the default arguments
            $this->setArguments();

            // Set a few help tabs so you can see how it's done
            $this->setHelpTabs();

            // Create the sections and fields
            $this->setSections();

            if (!isset($this->args['opt_name'])) { // No errors please
                return;
            }

            // If Redux is running as a plugin, this will remove the demo notice and links
            //add_action( 'redux/loaded', array( $this, 'remove_demo' ) );
            
            // Function to test the compiler hook and demo CSS output.
            // Above 10 is a priority, but 2 in necessary to include the dynamically generated CSS to be sent to the function.
            //add_filter('redux/options/'.$this->args['opt_name'].'/compiler', array( $this, 'compiler_action' ), 10, 3);
            
            // Change the arguments after they've been declared, but before the panel is created
            //add_filter('redux/options/'.$this->args['opt_name'].'/args', array( $this, 'change_arguments' ) );
            
            // Change the default value of a field after it's been set, but before it's been useds
            //add_filter('redux/options/'.$this->args['opt_name'].'/defaults', array( $this,'change_defaults' ) );
            
            // Dynamically add a section. Can be also used to modify sections/fields
            //add_filter('redux/options/' . $this->args['opt_name'] . '/sections', array($this, 'dynamic_section'));

            $this->ReduxFramework = new ReduxFramework($this->sections, $this->args);
        }

        /**

          This is a test function that will let you see when the compiler hook occurs.
          It only runs if a field	set with compiler=>true is changed.

         * */
        function compiler_action($options, $css, $changed_values) {
            echo '<h1>The compiler hook has run!</h1>';
            echo "<pre>";
            print_r($changed_values); // Values that have changed since the last save
            echo "</pre>";
            //print_r($options); //Option values
            //print_r($css); // Compiler selector CSS values  compiler => array( CSS SELECTORS )

            /*
              // Demo of how to use the dynamic CSS and write your own static CSS file
              $filename = dirname(__FILE__) . '/style' . '.css';
              global $wp_filesystem;
              if( empty( $wp_filesystem ) ) {
                require_once( ABSPATH .'/wp-admin/includes/file.php' );
              WP_Filesystem();
              }

              if( $wp_filesystem ) {
                $wp_filesystem->put_contents(
                    $filename,
                    $css,
                    FS_CHMOD_FILE // predefined mode settings for WP files
                );
              }
             */
        }

        /**

          Custom function for filtering the sections array. Good for child themes to override or add to the sections.
          Simply include this function in the child themes functions.php file.

          NOTE: the defined constants for URLs, and directories will NOT be available at this point in a child theme,
          so you must use get_template_directory_uri() if you want to use any of the built in icons

         * */
        function dynamic_section($sections) {
            //$sections = array();
            $sections[] = array(
                'title' => __('Section via hook', 'redux-framework-demo'),
                'desc' => __('<p class="description">This is a section created by adding a filter to the sections array. Can be used by child themes to add/remove sections from the options.</p>', 'redux-framework-demo'),
                'icon' => 'el-icon-paper-clip',
                // Leave this as a blank section, no options just some intro text set above.
                'fields' => array()
            );

            return $sections;
        }

        /**

          Filter hook for filtering the args. Good for child themes to override or add to the args array. Can also be used in other functions.

         * */
        function change_arguments($args) {
            //$args['dev_mode'] = true;

            return $args;
        }

        /**

          Filter hook for filtering the default value of any given field. Very useful in development mode.

         * */
        function change_defaults($defaults) {
            $defaults['str_replace'] = 'Testing filter hook!';

            return $defaults;
        }

        // Remove the demo link and the notice of integrated demo from the redux-framework plugin
        function remove_demo() {

            // Used to hide the demo mode link from the plugin page. Only used when Redux is a plugin.
            if (class_exists('ReduxFrameworkPlugin')) {
                remove_filter('plugin_row_meta', array(ReduxFrameworkPlugin::instance(), 'plugin_metalinks'), null, 2);

                // Used to hide the activation notice informing users of the demo panel. Only used when Redux is a plugin.
                remove_action('admin_notices', array(ReduxFrameworkPlugin::instance(), 'admin_notices'));
            }
        }

        public function setSections() {

            /**
              Used within different fields. Simply examples. Search for ACTUAL DECLARATION for field examples
             * */
            // Background Patterns Reader
            $sample_patterns_path   = ReduxFramework::$_dir . '../sample/patterns/';
            $sample_patterns_url    = ReduxFramework::$_url . '../sample/patterns/';
            $sample_patterns        = array();

            if (is_dir($sample_patterns_path)) :

                if ($sample_patterns_dir = opendir($sample_patterns_path)) :
                    $sample_patterns = array();

                    while (( $sample_patterns_file = readdir($sample_patterns_dir) ) !== false) {

                        if (stristr($sample_patterns_file, '.png') !== false || stristr($sample_patterns_file, '.jpg') !== false) {
                            $name = explode('.', $sample_patterns_file);
                            $name = str_replace('.' . end($name), '', $sample_patterns_file);
                            $sample_patterns[]  = array('alt' => $name, 'img' => $sample_patterns_url . $sample_patterns_file);
                        }
                    }
                endif;
            endif;

            ob_start();

            $ct             = wp_get_theme();
            $this->theme    = $ct;
            $item_name      = $this->theme->get('Name');
            $tags           = $this->theme->Tags;
            $screenshot     = $this->theme->get_screenshot();
            $class          = $screenshot ? 'has-screenshot' : '';

            $customize_title = sprintf(__('Customize &#8220;%s&#8221;', 'redux-framework-demo'), $this->theme->display('Name'));
            
            ?>
            <div id="current-theme" class="<?php echo esc_attr($class); ?>">
            <?php if ($screenshot) : ?>
                <?php if (current_user_can('edit_theme_options')) : ?>
                        <a href="<?php echo wp_customize_url(); ?>" class="load-customize hide-if-no-customize" title="<?php echo esc_attr($customize_title); ?>">
                            <img src="<?php echo esc_url($screenshot); ?>" alt="<?php esc_attr_e('Current theme preview'); ?>" />
                        </a>
                <?php endif; ?>
                    <img class="hide-if-customize" src="<?php echo esc_url($screenshot); ?>" alt="<?php esc_attr_e('Current theme preview'); ?>" />
                <?php endif; ?>

                <h4><?php echo $this->theme->display('Name'); ?></h4>

                <div>
                    <ul class="theme-info">
                        <li><?php printf(__('By %s', 'redux-framework-demo'), $this->theme->display('Author')); ?></li>
                        <li><?php printf(__('Version %s', 'redux-framework-demo'), $this->theme->display('Version')); ?></li>
                        <li><?php echo '<strong>' . __('Tags', 'redux-framework-demo') . ':</strong> '; ?><?php printf($this->theme->display('Tags')); ?></li>
                    </ul>
                    <p class="theme-description"><?php echo $this->theme->display('Description'); ?></p>
            <?php
            if ($this->theme->parent()) {
                printf(' <p class="howto">' . __('This <a href="%1$s">child theme</a> requires its parent theme, %2$s.') . '</p>', __('http://codex.wordpress.org/Child_Themes', 'redux-framework-demo'), $this->theme->parent()->display('Name'));
            }
            ?>

                </div>
            </div>

            <?php
            $item_info = ob_get_contents();

            ob_end_clean();

            $sampleHTML = '';
            if (file_exists(dirname(__FILE__) . '/info-html.html')) {
                Redux_Functions::initWpFilesystem();
                
                global $wp_filesystem;

                $sampleHTML = $wp_filesystem->get_contents(dirname(__FILE__) . '/info-html.html');
            }

            // ACTUAL DECLARATION OF SECTIONS
            $this->sections[] = array(
                'title'     => __('Home Settings', 'redux-framework-demo'),
                'desc'      => __('Redux Framework was created with the developer in mind. It allows for any theme developer to have an advanced theme panel with most of the features a developer would need. For more information check out the Github repo at: <a href="https://github.com/ReduxFramework/Redux-Framework">https://github.com/ReduxFramework/Redux-Framework</a>', 'redux-framework-demo'),
                'icon'      => 'el-icon-home',
                // 'submenu' => false, // Setting submenu to false on a given section will hide it from the WordPress sidebar menu!
                'fields'    => array(

                    array(
                        'id'        => 'opt-web-fonts',
                        'type'      => 'media',
                        'title'     => __('Web Fonts', 'redux-framework-demo'),
                        'compiler'  => 'true',
                        'mode'      => false, // Can be set to false to allow any media type, or can also be set to any mime type.
                        'desc'      => __('Basic media uploader with disabled URL input field.', 'redux-framework-demo'),
                        'subtitle'  => __('Upload any media using the WordPress native uploader', 'redux-framework-demo'),
                        'hint'      => array(
                            //'title'     => '',
                            'content'   => 'This is a <b>hint</b> tool-tip for the webFonts field.<br/><br/>Add any HTML based text you like here.',
                        )
                    ),
                    array(
                        'id'        => 'section-media-checkbox',
                        'type'      => 'switch',
                        'title'     => __('Section Show', 'redux-framework-demo'),
                        'subtitle'  => __('With the "section" field you can create indent option sections.', 'redux-framework-demo'),

                    ),
                    array(
                        'id'        => 'section-media-start',
                        'type'      => 'section',
                        'title'     => __('Media Options', 'redux-framework-demo'),
                        'subtitle'  => __('With the "section" field you can create indent option sections.', 'redux-framework-demo'),
                        'indent'    => true, // Indent all options below until the next 'section' option is set.
                        'required'  => array('section-media-checkbox', "=", 1),
                    ),
                    array(
                        'id'        => 'opt-media',
                        'type'      => 'media',
                        'url'       => true,
                        'title'     => __('Media w/ URL', 'redux-framework-demo'),
                        'compiler'  => 'true',
                        //'mode'      => false, // Can be set to false to allow any media type, or can also be set to any mime type.
                        'desc'      => __('Basic media uploader with disabled URL input field.', 'redux-framework-demo'),
                        'subtitle'  => __('Upload any media using the WordPress native uploader', 'redux-framework-demo'),
                        'default'   => array('url' => 'http://s.wordpress.org/style/images/codeispoetry.png'),
                        //'hint'      => array(
                        //    'title'     => 'Hint Title',
                        //    'content'   => 'This is a <b>hint</b> for the media field with a Title.',
                        //)
                    ),
                    array(
                        'id'        => 'section-media-end',
                        'type'      => 'section',
                        'indent'    => false, // Indent all options below until the next 'section' option is set.
                        'required'  => array('section-media-checkbox', "=", 1),
                    ),
                    array(
                        'id'        => 'media-no-url',
                        'type'      => 'media',
                        'title'     => __('Media w/o URL', 'redux-framework-demo'),
                        'desc'      => __('This represents the minimalistic view. It does not have the preview box or the display URL in an input box. ', 'redux-framework-demo'),
                        'subtitle'  => __('Upload any media using the WordPress native uploader', 'redux-framework-demo'),
                    ),
                    array(
                        'id'        => 'media-no-preview',
                        'type'      => 'media',
                        'preview'   => false,
                        'title'     => __('Media No Preview', 'redux-framework-demo'),
                        'desc'      => __('This represents the minimalistic view. It does not have the preview box or the display URL in an input box. ', 'redux-framework-demo'),
                        'subtitle'  => __('Upload any media using the WordPress native uploader', 'redux-framework-demo'),
                    ),
                    array(
                        'id'        => 'opt-gallery',
                        'type'      => 'gallery',
                        'title'     => __('Add/Edit Gallery', 'so-panels'),
                        'subtitle'  => __('Create a new Gallery by selecting existing or uploading new images using the WordPress native uploader', 'so-panels'),
                        'desc'      => __('This is the description field, again good for additional info.', 'redux-framework-demo'),
                    ),
                    array(
                        'id'            => 'opt-slider-label',
                        'type'          => 'slider',
                        'title'         => __('Slider Example 1', 'redux-framework-demo'),
                        'subtitle'      => __('This slider displays the value as a label.', 'redux-framework-demo'),
                        'desc'          => __('Slider description. Min: 1, max: 500, step: 1, default value: 250', 'redux-framework-demo'),
                        'default'       => 250,
                        'min'           => 1,
                        'step'          => 1,
                        'max'           => 500,
                        'display_value' => 'label'
                    ),
                    array(
                        'id'            => 'opt-slider-text',
                        'type'          => 'slider',
                        'title'         => __('Slider Example 2 with Steps (5)', 'redux-framework-demo'),
                        'subtitle'      => __('This example displays the value in a text box', 'redux-framework-demo'),
                        'desc'          => __('Slider description. Min: 0, max: 300, step: 5, default value: 75', 'redux-framework-demo'),
                        'default'       => 75,
                        'min'           => 0,
                        'step'          => 5,
                        'max'           => 300,
                        'display_value' => 'text'
                    ),
                    array(
                        'id'            => 'opt-slider-select',
                        'type'          => 'slider',
                        'title'         => __('Slider Example 3 with two sliders', 'redux-framework-demo'),
                        'subtitle'      => __('This example displays the values in select boxes', 'redux-framework-demo'),
                        'desc'          => __('Slider description. Min: 0, max: 500, step: 5, slider 1 default value: 100, slider 2 default value: 300', 'redux-framework-demo'),
                        'default'       => array(
                            1 => 100,
                            2 => 300,
                        ),
                        'min'           => 0,
                        'step'          => 5,
                        'max'           => '500',
                        'display_value' => 'select',
                        'handles'       => 2,
                    ),
                    array(
                        'id'            => 'opt-slider-float',
                        'type'          => 'slider',
                        'title'         => __('Slider Example 4 with float values', 'redux-framework-demo'),
                        'subtitle'      => __('This example displays float values', 'redux-framework-demo'),
                        'desc'          => __('Slider description. Min: 0, max: 1, step: .1, default value: .5', 'redux-framework-demo'),
                        'default'       => .5,
                        'min'           => 0,
                        'step'          => .1,
                        'max'           => 1,
                        'resolution'    => 0.1,
                        'display_value' => 'text'
                    ),
                    array(
                        'id'        => 'opt-spinner',
                        'type'      => 'spinner',
                        'title'     => __('JQuery UI Spinner Example 1', 'redux-framework-demo'),
                        'desc'      => __('JQuery UI spinner description. Min:20, max: 100, step:20, default value: 40', 'redux-framework-demo'),
                        'default'   => '40',
                        'min'       => '20',
                        'step'      => '20',
                        'max'       => '100',
                    ),
                    array(
                        'id'        => 'switch-on',
                        'type'      => 'switch',
                        'title'     => __('Switch On', 'redux-framework-demo'),
                        'subtitle'  => __('Look, it\'s on!', 'redux-framework-demo'),
                        'default'   => true,
                    ),
                    array(
                        'id'        => 'switch-off',
                        'type'      => 'switch',
                        'title'     => __('Switch Off', 'redux-framework-demo'),
                        'subtitle'  => __('Look, it\'s on!', 'redux-framework-demo'),
                        //'options' => array('on', 'off'),
                        'default'   => false,
                    ),
                    array(
                        'id'        => 'switch-parent',
                        'type'      => 'switch',
                        'title'     => __('Switch - Nested Children, Enable to show', 'redux-framework-demo'),
                        'subtitle'  => __('Look, it\'s on! Also hidden child elements!', 'redux-framework-demo'),
                        'default'   => 0,
                        'on'        => 'Enabled',
                        'off'       => 'Disabled',
                    ),
                    array(
                        'id'        => 'switch-child1',
                        'type'      => 'switch',
                        'required'  => array('switch-parent', '=', '1'),
                        'title'     => __('Switch - This and the next switch required for patterns to show', 'redux-framework-demo'),
                        'subtitle'  => __('Also called a "fold" parent.', 'redux-framework-demo'),
                        'desc'      => __('Items set with a fold to this ID will hide unless this is set to the appropriate value.', 'redux-framework-demo'),
                        'default'   => false,
                    ),
                    array(
                        'id'        => 'switch-child2',
                        'type'      => 'switch',
                        'required'  => array('switch-parent', '=', '1'),
                        'title'     => __('Switch2 - Enable the above switch and this one for patterns to show', 'redux-framework-demo'),
                        'subtitle'  => __('Also called a "fold" parent.', 'redux-framework-demo'),
                        'desc'      => __('Items set with a fold to this ID will hide unless this is set to the appropriate value.', 'redux-framework-demo'),
                        'default'   => false,
                    ),                    
                    array(
                        'id'        => 'opt-patterns',
                        'type'      => 'image_select',
                        'tiles'     => true,
                        'required'  => array(
                                            array('switch-child1', 'equals', 1),
                                            array('switch-child2', 'equals', 1),
                                       ),
                        'title'     => __('Images Option (with pattern=>true)', 'redux-framework-demo'),
                        'subtitle'  => __('Select a background pattern.', 'redux-framework-demo'),
                        'default'   => 0,
                        'options'   => $sample_patterns
                    ,
                    ),
                    array(
                        'id'        => 'opt-homepage-layout',
                        'type'      => 'sorter',
                        'title'     => 'Layout Manager Advanced',
                        'subtitle'  => 'You can add multiple drop areas or columns.',
                        'compiler'  => 'true',
                        'options'   => array(
                            'enabled'   => array(
                                'highlights'    => 'Highlights',
                                'slider'        => 'Slider',
                                'staticpage'    => 'Static Page',
                                'services'      => 'Services'
                            ),
                            'disabled'  => array(
                            ),
                            'backup'    => array(
                            ),
                        ),
                        'limits' => array(
                            'disabled'  => 1,
                            'backup'    => 2,
                        ),
                    ),
                    
                    array(
                        'id'        => 'opt-homepage-layout-2',
                        'type'      => 'sorter',
                        'title'     => 'Homepage Layout Manager',
                        'desc'      => 'Organize how you want the layout to appear on the homepage',
                        'compiler'  => 'true',
                        'options'   => array(
                            'disabled'  => array(
                                'highlights'    => 'Highlights',
                                'slider'        => 'Slider',
                            ),
                            'enabled'   => array(
                                'staticpage'    => 'Static Page',
                                'services'      => 'Services'
                            ),
                        ),
                    ),
                    array(
                        'id'        => 'opt-slides',
                        'type'      => 'slides',
                        'title'     => __('Slides Options', 'redux-framework-demo'),
                        'subtitle'  => __('Unlimited slides with drag and drop sortings.', 'redux-framework-demo'),
                        'desc'      => __('This field will store all slides values into a multidimensional array to use into a foreach loop.', 'redux-framework-demo'),
                        'placeholder'   => array(
                            'title'         => __('This is a title', 'redux-framework-demo'),
                            'description'   => __('Description Here', 'redux-framework-demo'),
                            'url'           => __('Give us a link!', 'redux-framework-demo'),
                        ),
                    ),
                    array(
                        'id'        => 'opt-presets',
                        'type'      => 'image_select',
                        'presets'   => true,
                        'title'     => __('Preset', 'redux-framework-demo'),
                        'subtitle'  => __('This allows you to set a json string or array to override multiple preferences in your theme.', 'redux-framework-demo'),
                        'default'   => 0,
                        'desc'      => __('This allows you to set a json string or array to override multiple preferences in your theme.', 'redux-framework-demo'),
                        'options'   => array(
                            '1'         => array('alt' => 'Preset 1', 'img' => ReduxFramework::$_url . '../sample/presets/preset1.png', 'presets' => array('switch-on' => 1, 'switch-off' => 1, 'switch-parent' => 1)),
                            '2'         => array('alt' => 'Preset 2', 'img' => ReduxFramework::$_url . '../sample/presets/preset2.png', 'presets' => '{"opt-slider-label":"1", "opt-slider-text":"10"}'),
                        ),
                    ),
                    array(
                        'id'            => 'opt-typography',
                        'type'          => 'typography',
                        'title'         => __('Typography', 'redux-framework-demo'),
                        //'compiler'      => true,  // Use if you want to hook in your own CSS compiler
                        'google'        => true,    // Disable google fonts. Won't work if you haven't defined your google api key
                        'font-backup'   => true,    // Select a backup non-google font in addition to a google font
                        //'font-style'    => false, // Includes font-style and weight. Can use font-style or font-weight to declare
                        //'subsets'       => false, // Only appears if google is true and subsets not set to false
                        //'font-size'     => false,
                        //'line-height'   => false,
                        //'word-spacing'  => true,  // Defaults to false
                        //'letter-spacing'=> true,  // Defaults to false
                        //'color'         => false,
                        //'preview'       => false, // Disable the previewer
                        'all_styles'    => true,    // Enable all Google Font style/weight variations to be added to the page
                        'output'        => array('h2.site-description, .entry-title'), // An array of CSS selectors to apply this font style to dynamically
                        'compiler'      => array('h2.site-description-compiler'), // An array of CSS selectors to apply this font style to dynamically
                        'units'         => 'px', // Defaults to px
                        'subtitle'      => __('Typography option with each property can be called individually.', 'redux-framework-demo'),
                        'default'       => array(
                            'color'         => '#333',
                            'font-style'    => '700',
                            'font-family'   => 'Abel',
                            'google'        => true,
                            'font-size'     => '33px',
                            'line-height'   => '40px'),
                    ),
                ),
            );

            $this->sections[] = array(
                'type' => 'divide',
            );

            $this->sections[] = array(
                'icon'      => 'el-icon-cogs',
                'title'     => __('General Settings', 'redux-framework-demo'),
                'fields'    => array(
                    array(
                        'id'        => 'opt-layout',
                        'type'      => 'image_select',
                        'compiler'  => true,
                        'title'     => __('Main Layout', 'redux-framework-demo'),
                        'subtitle'  => __('Select main content and sidebar alignment. Choose between 1, 2 or 3 column layout.', 'redux-framework-demo'),
                        'options'   => array(
                            '1' => array('alt' => '1 Column',       'img' => ReduxFramework::$_url . 'assets/img/1col.png'),
                            '2' => array('alt' => '2 Column Left',  'img' => ReduxFramework::$_url . 'assets/img/2cl.png'),
                            '3' => array('alt' => '2 Column Right', 'img' => ReduxFramework::$_url . 'assets/img/2cr.png'),
                            '4' => array('alt' => '3 Column Middle','img' => ReduxFramework::$_url . 'assets/img/3cm.png'),
                            '5' => array('alt' => '3 Column Left',  'img' => ReduxFramework::$_url . 'assets/img/3cl.png'),
                            '6' => array('alt' => '3 Column Right', 'img' => ReduxFramework::$_url . 'assets/img/3cr.png')
                        ),
                        'default'   => '2'
                    ),
                    array(
                        'id'        => 'opt-textarea',
                        'type'      => 'textarea',
                        'required'  => array('layout', 'equals', '1'),
                        'title'     => __('Tracking Code', 'redux-framework-demo'),
                        'subtitle'  => __('Paste your Google Analytics (or other) tracking code here. This will be added into the footer template of your theme.', 'redux-framework-demo'),
                        'validate'  => 'js',
                        'desc'      => 'Validate that it\'s javascript!',
                    ),
                    array(
                        'id'        => 'opt-ace-editor-css',
                        'type'      => 'ace_editor',
                        'title'     => __('CSS Code', 'redux-framework-demo'),
                        'subtitle'  => __('Paste your CSS code here.', 'redux-framework-demo'),
                        'mode'      => 'css',
                        'theme'     => 'monokai',
                        'desc'      => 'Possible modes can be found at <a href="http://ace.c9.io" target="_blank">http://ace.c9.io/</a>.',
                        'default'   => "#header{\nmargin: 0 auto;\n}"
                    ),
                    /*
                    array(
                        'id'        => 'opt-ace-editor-js',
                        'type'      => 'ace_editor',
                        'title'     => __('JS Code', 'redux-framework-demo'),
                        'subtitle'  => __('Paste your JS code here.', 'redux-framework-demo'),
                        'mode'      => 'javascript',
                        'theme'     => 'chrome',
                        'desc'      => 'Possible modes can be found at <a href="http://ace.c9.io" target="_blank">http://ace.c9.io/</a>.',
                        'default'   => "jQuery(document).ready(function(){\n\n});"
                    ),
                    array(
                        'id'        => 'opt-ace-editor-php',
                        'type'      => 'ace_editor',
                        'title'     => __('PHP Code', 'redux-framework-demo'),
                        'subtitle'  => __('Paste your PHP code here.', 'redux-framework-demo'),
                        'mode'      => 'php',
                        'theme'     => 'chrome',
                        'desc'      => 'Possible modes can be found at <a href="http://ace.c9.io" target="_blank">http://ace.c9.io/</a>.',
                        'default'   => '<?php\nisset ( $redux ) ? true : false;\n?>'
                    ),
                    */
                    array(
                        'id'        => 'opt-editor',
                        'type'      => 'editor',
                        'title'     => __('Footer Text', 'redux-framework-demo'),
                        'subtitle'  => __('You can use the following shortcodes in your footer text: [wp-url] [site-url] [theme-url] [login-url] [logout-url] [site-title] [site-tagline] [current-year]', 'redux-framework-demo'),
                        'default'   => 'Powered by Redux Framework.',
                    ),
                    array(
                        'id'        => 'password',
                        'type'      => 'password',
                        'username'  => true,
                        'title'     => 'SMTP Account',
                        //'placeholder' => array('username' => 'Enter your Username')
                    )
                )
            );

            $this->sections[] = array(
                'icon'      => 'el-icon-website',
                'title'     => __('Styling Options', 'redux-framework-demo'),
                'subsection' => true,
                'fields'    => array(
                    array(
                        'id'        => 'opt-select-stylesheet',
                        'type'      => 'select',
                        'title'     => __('Theme Stylesheet', 'redux-framework-demo'),
                        'subtitle'  => __('Select your themes alternative color scheme.', 'redux-framework-demo'),
                        'options'   => array('default.css' => 'default.css', 'color1.css' => 'color1.css'),
                        'default'   => 'default.css',
                    ),
                    array(
                        'id'        => 'opt-color-background',
                        'type'      => 'color',
                        'output'    => array('.site-title'),
                        'title'     => __('Body Background Color', 'redux-framework-demo'),
                        'subtitle'  => __('Pick a background color for the theme (default: #fff).', 'redux-framework-demo'),
                        'default'   => '#FFFFFF',
                        'validate'  => 'color',
                    ),
                    array(
                        'id'        => 'opt-background',
                        'type'      => 'background',
                        'output'    => array('body'),
                        'title'     => __('Body Background', 'redux-framework-demo'),
                        'subtitle'  => __('Body background with image, color, etc.', 'redux-framework-demo'),
                        //'default'   => '#FFFFFF',
                    ),
                    array(
                        'id'        => 'opt-color-footer',
                        'type'      => 'color',
                        'title'     => __('Footer Background Color', 'redux-framework-demo'),
                        'subtitle'  => __('Pick a background color for the footer (default: #dd9933).', 'redux-framework-demo'),
                        'default'   => '#dd9933',
                        'validate'  => 'color',
                    ),
                    array(
                        'id'        => 'opt-color-rgba',
                        'type'      => 'color_rgba',
                        'title'     => __('Color RGBA - BETA', 'redux-framework-demo'),
                        'subtitle'  => __('Gives you the RGBA color. Still quite experimental. Use at your own risk.', 'redux-framework-demo'),
                        'default'   => array('color' => '#dd9933', 'alpha' => '1.0'),
                        'output'    => array('body'),
                        'mode'      => 'background',
                        'validate'  => 'colorrgba',
                    ),
                    array(
                        'id'        => 'opt-color-header',
                        'type'      => 'color_gradient',
                        'title'     => __('Header Gradient Color Option', 'redux-framework-demo'),
                        'subtitle'  => __('Only color validation can be done on this field type', 'redux-framework-demo'),
                        'desc'      => __('This is the description field, again good for additional info.', 'redux-framework-demo'),
                        'default'   => array(
                            'from'      => '#1e73be', 
                            'to'        => '#00897e'
                        )
                    ),
                    array(
                        'id'        => 'opt-link-color',
                        'type'      => 'link_color',
                        'title'     => __('Links Color Option', 'redux-framework-demo'),
                        'subtitle'  => __('Only color validation can be done on this field type', 'redux-framework-demo'),
                        'desc'      => __('This is the description field, again good for additional info.', 'redux-framework-demo'),
                        //'regular'   => false, // Disable Regular Color
                        //'hover'     => false, // Disable Hover Color
                        //'active'    => false, // Disable Active Color
                        //'visited'   => true,  // Enable Visited Color
                        'default'   => array(
                            'regular'   => '#aaa',
                            'hover'     => '#bbb',
                            'active'    => '#ccc',
                        )
                    ),
                    array(
                        'id'        => 'opt-header-border',
                        'type'      => 'border',
                        'title'     => __('Header Border Option', 'redux-framework-demo'),
                        'subtitle'  => __('Only color validation can be done on this field type', 'redux-framework-demo'),
                        'output'    => array('.site-header'), // An array of CSS selectors to apply this font style to
                        'desc'      => __('This is the description field, again good for additional info.', 'redux-framework-demo'),
                        'default'   => array(
                            'border-color'  => '#1e73be', 
                            'border-style'  => 'solid', 
                            'border-top'    => '3px', 
                            'border-right'  => '3px', 
                            'border-bottom' => '3px', 
                            'border-left'   => '3px'
                        )
                    ),
                    array(
                        'id'            => 'opt-spacing',
                        'type'          => 'spacing',
                        'output'        => array('.site-header'), // An array of CSS selectors to apply this font style to
                        'mode'          => 'margin',    // absolute, padding, margin, defaults to padding
                        'all'           => true,        // Have one field that applies to all
                        //'top'           => false,     // Disable the top
                        //'right'         => false,     // Disable the right
                        //'bottom'        => false,     // Disable the bottom
                        //'left'          => false,     // Disable the left
                        //'units'         => 'em',      // You can specify a unit value. Possible: px, em, %
                        //'units_extended'=> 'true',    // Allow users to select any type of unit
                        //'display_units' => 'false',   // Set to false to hide the units if the units are specified
                        'title'         => __('Padding/Margin Option', 'redux-framework-demo'),
                        'subtitle'      => __('Allow your users to choose the spacing or margin they want.', 'redux-framework-demo'),
                        'desc'          => __('You can enable or disable any piece of this field. Top, Right, Bottom, Left, or Units.', 'redux-framework-demo'),
                        'default'       => array(
                            'margin-top'    => '1px', 
                            'margin-right'  => '2px', 
                            'margin-bottom' => '3px', 
                            'margin-left'   => '4px'
                        )
                    ),
                    array(
                        'id'                => 'opt-dimensions',
                        'type'              => 'dimensions',
                        'units'             => 'em',    // You can specify a unit value. Possible: px, em, %
                        'units_extended'    => 'true',  // Allow users to select any type of unit
                        'title'             => __('Dimensions (Width/Height) Option', 'redux-framework-demo'),
                        'subtitle'          => __('Allow your users to choose width, height, and/or unit.', 'redux-framework-demo'),
                        'desc'              => __('You can enable or disable any piece of this field. Width, Height, or Units.', 'redux-framework-demo'),
                        'default'           => array(
                            'width'     => 200, 
                            'height'    => 100,
                        )
                    ),
                    array(
                        'id'        => 'opt-typography-body',
                        'type'      => 'typography',
                        'title'     => __('Body Font', 'redux-framework-demo'),
                        'subtitle'  => __('Specify the body font properties.', 'redux-framework-demo'),
                        'google'    => true,
                        'default'   => array(
                            'color'         => '#dd9933',
                            'font-size'     => '30px',
                            'font-family'   => 'Arial,Helvetica,sans-serif',
                            'font-weight'   => 'Normal',
                        ),
                    ),
                    array(
                        'id'        => 'opt-custom-css',
                        'type'      => 'textarea',
                        'title'     => __('Custom CSS', 'redux-framework-demo'),
                        'subtitle'  => __('Quickly add some CSS to your theme by adding it to this block.', 'redux-framework-demo'),
                        'desc'      => __('This field is even CSS validated!', 'redux-framework-demo'),
                        'validate'  => 'css',
                    ),
                    array(
                        'id'        => 'opt-custom-html',
                        'type'      => 'textarea',
                        'title'     => __('Custom HTML', 'redux-framework-demo'),
                        'subtitle'  => __('Just like a text box widget.', 'redux-framework-demo'),
                        'desc'      => __('This field is even HTML validated!', 'redux-framework-demo'),
                        'validate'  => 'html',
                    ),
                )
            );

            /**
             *  Note here I used a 'heading' in the sections array construct
             *  This allows you to use a different title on your options page
             * instead of reusing the 'title' value.  This can be done on any
             * section - kp
             */

            $theme_info  = '<div class="redux-framework-section-desc">';
            $theme_info .= '<p class="redux-framework-theme-data description theme-uri">' . __('<strong>Theme URL:</strong> ', 'redux-framework-demo') . '<a href="' . $this->theme->get('ThemeURI') . '" target="_blank">' . $this->theme->get('ThemeURI') . '</a></p>';
            $theme_info .= '<p class="redux-framework-theme-data description theme-author">' . __('<strong>Author:</strong> ', 'redux-framework-demo') . $this->theme->get('Author') . '</p>';
            $theme_info .= '<p class="redux-framework-theme-data description theme-version">' . __('<strong>Version:</strong> ', 'redux-framework-demo') . $this->theme->get('Version') . '</p>';
            $theme_info .= '<p class="redux-framework-theme-data description theme-description">' . $this->theme->get('Description') . '</p>';
            $tabs = $this->theme->get('Tags');
            if (!empty($tabs)) {
                $theme_info .= '<p class="redux-framework-theme-data description theme-tags">' . __('<strong>Tags:</strong> ', 'redux-framework-demo') . implode(', ', $tabs) . '</p>';
            }
            $theme_info .= '</div>';

        }

        public function setHelpTabs() {

            // Custom page help tabs, displayed using the help API. Tabs are shown in order of definition.
            $this->args['help_tabs'][] = array(
                'id'        => 'redux-help-tab-1',
                'title'     => __('Theme Information 1', 'redux-framework-demo'),
                'content'   => __('<p>This is the tab content, HTML is allowed.</p>', 'redux-framework-demo')
            );

            $this->args['help_tabs'][] = array(
                'id'        => 'redux-help-tab-2',
                'title'     => __('Theme Information 2', 'redux-framework-demo'),
                'content'   => __('<p>This is the tab content, HTML is allowed.</p>', 'redux-framework-demo')
            );

            // Set the help sidebar
            $this->args['help_sidebar'] = __('<p>This is the sidebar content, HTML is allowed.</p>', 'redux-framework-demo');
        }

        /**

          All the possible arguments for Redux.
          For full documentation on arguments, please refer to: https://github.com/ReduxFramework/ReduxFramework/wiki/Arguments

         * */
        public function setArguments() {

            $theme = wp_get_theme(); // For use with some settings. Not necessary.

            $this->args = array(
                // TYPICAL -> Change these values as you need/desire
                'opt_name'          => 'redux_demo',            // This is where your data is stored in the database and also becomes your global variable name.
                'display_name'      => $theme->get('Name'),     // Name that appears at the top of your panel
                'display_version'   => $theme->get('Version'),  // Version that appears at the top of your panel
                'menu_type'         => 'menu',                  //Specify if the admin menu should appear or not. Options: menu or submenu (Under appearance only)
                'allow_sub_menu'    => true,                    // Show the sections below the admin menu item or not
                'menu_title'        => __('Sample Options', 'redux-framework-demo'),
                'page_title'        => __('Sample Options', 'redux-framework-demo'),
                
                // You will need to generate a Google API key to use this feature.
                // Please visit: https://developers.google.com/fonts/docs/developer_api#Auth
                'google_api_key' => '', // Must be defined to add google fonts to the typography module
                
                'async_typography'  => true,                    // Use a asynchronous font on the front end or font string
                //'disable_google_fonts_link' => true,                    // Disable this in case you want to create your own google fonts loader
                'admin_bar'         => true,                    // Show the panel pages on the admin bar
                'global_variable'   => '',                      // Set a different name for your global variable other than the opt_name
                'dev_mode'          => true,                    // Show the time the page took to load, etc
                'customizer'        => true,                    // Enable basic customizer support
                //'open_expanded'     => true,                    // Allow you to start the panel in an expanded way initially.
                //'disable_save_warn' => true,                    // Disable the save warning when a user changes a field

                // OPTIONAL -> Give you extra features
                'page_priority'     => null,                    // Order where the menu appears in the admin area. If there is any conflict, something will not show. Warning.
                'page_parent'       => 'themes.php',            // For a full list of options, visit: http://codex.wordpress.org/Function_Reference/add_submenu_page#Parameters
                'page_permissions'  => 'manage_options',        // Permissions needed to access the options panel.
                'menu_icon'         => '',                      // Specify a custom URL to an icon
                'last_tab'          => '',                      // Force your panel to always open to a specific tab (by id)
                'page_icon'         => 'icon-themes',           // Icon displayed in the admin panel next to your menu_title
                'page_slug'         => '_options',              // Page slug used to denote the panel
                'save_defaults'     => true,                    // On load save the defaults to DB before user clicks save or not
                'default_show'      => false,                   // If true, shows the default value next to each field that is not the default value.
                'default_mark'      => '',                      // What to print by the field's title if the value shown is default. Suggested: *
                'show_import_export' => true,                   // Shows the Import/Export panel when not used as a field.
                
                // CAREFUL -> These options are for advanced use only
                'transient_time'    => 60 * MINUTE_IN_SECONDS,
                'output'            => true,                    // Global shut-off for dynamic CSS output by the framework. Will also disable google fonts output
                'output_tag'        => true,                    // Allows dynamic CSS to be generated for customizer and google fonts, but stops the dynamic CSS from going to the head
                // 'footer_credit'     => '',                   // Disable the footer credit of Redux. Please leave if you can help it.
                
                // FUTURE -> Not in use yet, but reserved or partially implemented. Use at your own risk.
                'database'              => '', // possible: options, theme_mods, theme_mods_expanded, transient. Not fully functional, warning!
                'system_info'           => false, // REMOVE

                // HINTS
                'hints' => array(
                    'icon'          => 'icon-question-sign',
                    'icon_position' => 'right',
                    'icon_color'    => 'lightgray',
                    'icon_size'     => 'normal',
                    'tip_style'     => array(
                        'color'         => 'light',
                        'shadow'        => true,
                        'rounded'       => false,
                        'style'         => '',
                    ),
                    'tip_position'  => array(
                        'my' => 'top left',
                        'at' => 'bottom right',
                    ),
                    'tip_effect'    => array(
                        'show'          => array(
                            'effect'        => 'slide',
                            'duration'      => '500',
                            'event'         => 'mouseover',
                        ),
                        'hide'      => array(
                            'effect'    => 'slide',
                            'duration'  => '500',
                            'event'     => 'click mouseleave',
                        ),
                    ),
                )
            );


            // SOCIAL ICONS -> Setup custom links in the footer for quick links in your panel footer icons.
            $this->args['share_icons'][] = array(
                'url'   => 'https://github.com/ReduxFramework/ReduxFramework',
                'title' => 'Visit us on GitHub',
                'icon'  => 'el-icon-github'
                //'img'   => '', // You can use icon OR img. IMG needs to be a full URL.
            );
            $this->args['share_icons'][] = array(
                'url'   => 'https://www.facebook.com/pages/Redux-Framework/243141545850368',
                'title' => 'Like us on Facebook',
                'icon'  => 'el-icon-facebook'
            );
            $this->args['share_icons'][] = array(
                'url'   => 'http://twitter.com/reduxframework',
                'title' => 'Follow us on Twitter',
                'icon'  => 'el-icon-twitter'
            );
            $this->args['share_icons'][] = array(
                'url'   => 'http://www.linkedin.com/company/redux-framework',
                'title' => 'Find us on LinkedIn',
                'icon'  => 'el-icon-linkedin'
            );

            // Panel Intro text -> before the form
            if (!isset($this->args['global_variable']) || $this->args['global_variable'] !== false) {
                if (!empty($this->args['global_variable'])) {
                    $v = $this->args['global_variable'];
                } else {
                    $v = str_replace('-', '_', $this->args['opt_name']);
                }
                $this->args['intro_text'] = sprintf(__('<p>Here you can modify the option of the theme</p>', 'redux-framework-demo'), $v);
            } else {
                $this->args['intro_text'] = __('<p>This text is displayed above the options panel. It isn\'t required, but more info is always better! The intro_text field accepts all HTML.</p>', 'redux-framework-demo');
            }

            // Add content after the form.
            $this->args['footer_text'] = __('<p>This text is displayed below the options panel. It isn\'t required, but more info is always better! The footer_text field accepts all HTML.</p>', 'redux-framework-demo');
        }

    }
    
    global $reduxConfig;
    $reduxConfig = new Redux_Framework_sample_config();
}

/**
  Custom function for the callback referenced above
 */
if (!function_exists('redux_my_custom_field')):
    function redux_my_custom_field($field, $value) {
        print_r($field);
        echo '<br/>';
        print_r($value);
    }
endif;

/**
  Custom function for the callback validation referenced above
 * */
if (!function_exists('redux_validate_callback_function')):
    function redux_validate_callback_function($field, $value, $existing_value) {
        $error = false;
        $value = 'just testing';

        /*
          do your validation

          if(something) {
            $value = $value;
          } elseif(something else) {
            $error = true;
            $value = $existing_value;
            $field['msg'] = 'your custom error message';
          }
         */

        $return['value'] = $value;
        if ($error == true) {
            $return['error'] = $field;
        }
        return $return;
    }
endif;
