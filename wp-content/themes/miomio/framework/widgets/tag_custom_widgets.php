<?php
/**
 * Plugin Name: support ranking post
 * Description: A widget that show ranking post : categories, tags,views,...
 * Version: 1.0
 * Author: thaivt
 * Author Email: thaivt@vn.innovaiton.co.jp
 *
 */

add_action( 'widgets_init', 'tag_custom_widget' );

function tag_custom_widget() {
	register_widget( 'Tag_Custom_Widget' );
}

class Tag_Custom_Widget extends WP_Widget {

	/**
	 * Widget setup.
	 */
	function  Tag_Custom_Widget() {
		/* Widget settings. */
		$widget_ops = array( 'classname' => 'lf_ranking-post-widget', 'description' => __('A widget that show ranking post', 'support') );
		$control_ops = array( 'width' => 300, 'height' => 350, 'id_base' => 'lf_ranking-post-widget' );
		$this->WP_Widget( 'lf_ranking-post-widget', 'Show All Tag', $widget_ops, $control_ops );
	}

	/**
	 * Display the widget on the screen.
	 */
	function widget( $args, $instance ) {
		extract( $args );

		
		$title = (isset($instance['title'])) ? apply_filters('Tag Search', $instance['title'] ) : '';
		/* Before widget*/
		echo $before_widget;
		if ($title) {
			echo $before_title . $title . $after_title;
		}

		/* Display the category*/
		$ouput_tag = $tag_html = '';
		$head_html = '<div class="bar-main">';
		$head_html .= '<h3> ' . __('Tag', 'talk'). '</h3>';
		
		if(get_the_tag_list()) {
			$tag_html .= get_the_tag_list('<ul><li>','</li><li>','</li></ul>');
		}
		$head_html .= $tag_html . '<div>';
		echo $head_html;

		/* After widget */
		echo $after_widget;
	}
}