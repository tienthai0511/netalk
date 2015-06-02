<?php get_header(); ?>

<section class="main-container">
    <div class="row">
        <div class="medium-8 columns">
            
			<?php
				// Start the Loop.
				while ( have_posts() ) : the_post();

					/*
					 * Include the post format-specific template for the content. If you want to
					 * use this in a child theme, then include a file called called content-___.php
					 * (where ___ is the post format) and that will be used instead.
					 */
					get_template_part( 'content', get_post_format() );


				endwhile;
				$prev_post = get_previous_post();
				$next_post = get_next_post();
				?>
				<div class="ct-post-nav">
				<?php if (!empty( $prev_post )): ?>
				<div class="ct-post-prev">
					<strong>Previous:</strong><br> <a href="<?php echo get_permalink( $prev_post->ID ); ?>" rel="prev"><?php echo $prev_post->post_title; ?></a>  
				</div>
				<?php endif; ?>
				<?php if ( is_a( $next_post , 'WP_Post' ) ) : ?>
				<div class="ct-post-next">
					<strong>Next:</strong><br> <a href="<?php echo get_permalink( $next_post->ID ); ?>" rel="next"><?php echo get_the_title( $next_post->ID ); ?></a>  
				</div>
				<?php endif; ?>
				<div class="clr"></div>
			</div>
			<?php
			$post_id = $post->ID;
			//get related faq post in metabox
			$data = get_post_meta($post_id, 'related_posts_post', FALSE);
			$tags = wp_get_post_tags($post_id);
			$array_term_id = $_realated_id = array();
			if (!empty($data[0] )) {
				$data = explode(',', $data[0]);

				$args_re = array(
					'post__in' => $data,
					'post_type' => 'post',
				);

				$the_query_re = new WP_Query( $args_re );
				if ($the_query_re->have_posts()) {
					while ($the_query_re->have_posts()) {
						$the_query_re->the_post();
						$_realated_id[] = get_the_ID();
					}
				}
				wp_reset_postdata();
			}

			foreach ($tags as $term_id) {
				$array_term_id[] = $term_id->term_id;
			}

			if (count($array_term_id) > 0) {
				//get post the same tag/ taxonomy
				$args = array(
					'post__not_in' => array($post_id),
					'post_type' => 'post',
					'tag__in' => $array_term_id
				);

				$the_query_tag = new WP_Query( $args );
				if ($the_query_tag->have_posts()) {
					while ($the_query_tag->have_posts()) {
						$the_query_tag->the_post();
						$_realated_id[] = get_the_ID();
					}
				}
				wp_reset_postdata();
			}

			if (count($_realated_id) > 0) {
				$_realated_id = array_unique($_realated_id);
			}
			$args_show = array(
				'post__in'  => $_realated_id,
				'post_type' => 'post',
				'posts_per_page' => 4,
				//'meta_key'  => 'post_views_count',
				//'orderby'   => 'meta_value_num',
				'order'     => 'DESC',
			);
			$the_query = new WP_Query( $args_show );
			?>
			<?php if ($the_query->have_posts() && count($_realated_id) > 0) : ?>
			<div class="related-post">
				<div class="row">
				<div class="small-12 columns">
					<h3>Related Articles</h3>
					<ul style="margin-left:0">
					<?php while ($the_query->have_posts()) : $the_query->the_post(); ?>
						<?php
							$thumbnail_id = get_post_thumbnail_id();
							$thumbnail = wp_get_attachment_image_src( $thumbnail_id , '250x250');
							$thumbnail_img = (!empty($thumbnail)) ? $thumbnail[0] : DEFAUL_THUMNAIL;
						?>
						<li class="item-relate">
							<a href="<?php echo get_permalink(); ?>"><img src="<?php echo $thumbnail_img ;?> " width="300" height="162" alt="<?php the_title();?>"  >
							<p class="text-related"><?php the_title();?></p>
							</a>
						</li>
						<?php
							endwhile;
							wp_reset_postdata();
						?>
					</ul>
					</div>
				</div>
			</div>
		<?php endif; ?>
			<div class="comment-section">
				<div class="row">
					<div class="small-12 columns">
						<?php 

						// If comments are open or we have at least one comment, load up the comment template.
						if ( comments_open() || get_comments_number() ) {
							comments_template();
						}
						
						?>
					</div>
				</div>

			</div> <!-- comment-section -->

        </div>
        <div class="medium-4 columns">

            <?php get_sidebar(); ?>
        
        </div>
    </div>
</section> <!-- main wrapper -->

<?php get_footer(); ?>
