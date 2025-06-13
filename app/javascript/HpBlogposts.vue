<template>
  <div
    ref="elementRef"
    :class="{ 'block__content': onHp }"
  >
    <div
      class="blog-section"
      v-if="isDataLoaded && hasAnyPosts"
    >
      <h2>
        {{ $t('blog.title') }}
      </h2>

      <div class="blog-grid">
        <div
          v-for="post in collection"
          :key="post.uid"
          class="blog-card"
        >
          <a
            :href="post.path"
            class="blog-card__link"
          >
            <div class="blog-card__image">
              <img
                :src="post.smallImage"
                :alt="post.title"
              >
            </div>
            <div class="blog-card__content">
              <h3 class="blog-card__title">
                {{ post.title }}
              </h3>
              <div class="blog-card__date">
                {{ post.createdAt | formatDate('dd. MM. yyyy') }}
              </div>
              <p class="blog-card__perex">{{ post.perex }}</p>
            </div>
          </a>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { POSTS_QUERY } from '~/queries';

export default {
  props: {
    postsCount: {
      default: 6,
      type: Number,
    },
    onHp: {
      default: false,
      type: Boolean,
    },
  },
  apollo: {
    posts: {
      query: POSTS_QUERY,
      variables() {
        return {
          limit: this.postsCount,
        };
      },
      result() {
        this.isDataLoaded = true;
      },
      skip() {
        return this.skipQuery;
      },
    },
  },
  data: () => ({
    isDataLoaded: false,
    isInViewport: false,
    skipQuery: true,
  }),
  computed: {
    collection() {
      return this.posts.collection;
    },
    hasAnyPosts() {
      return this.collection.length > 0;
    },
  },
  methods: {
    getArticleImg(article) {
      return article.data.featured_image.url;
    },
    getArticleTitle(article) {
      return article.data.title[0].text;
    },
    onIntersection(entries) {
      const [entry] = entries;
      if (entry.isIntersecting && !this.isDataLoaded) {
        this.fetchPosts();
      }
    },
    fetchPosts() {
      this.skipQuery = false;
      this.$apollo.queries.posts.refetch();
    },
  },
  mounted() {
    const offsets = {
      root: null,
      rootMargin: '0px',
      threshold: 0,
    };
    const observer = new IntersectionObserver(this.onIntersection, offsets);

    observer.observe(this.$refs.elementRef);
  },
};
</script>

<style lang="scss" scoped>
  .blog-section {
    padding: 2rem 0;
  }

  h2 {
    font-size: 2.13rem;
    margin-bottom: 2rem;
    font-weight: 700;
    text-align: center;
  }

  .blog-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 2rem;
    
    @media (max-width: $--breakpoint-sm) {
      grid-template-columns: 1fr;
      gap: 1.5rem;
    }
  }

  .blog-card {
    background: white;
    overflow: hidden;
    transition: transform 0.2s ease;
    
    &:hover {
      transform: translateY(-4px);
    }
  }

  .blog-card__link {
    display: block;
    text-decoration: none;
    color: inherit;
  }

  .blog-card__image {
    width: 100%;
    height: 200px;
    overflow: hidden;
    
    img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
  }

  .blog-card__content {
    padding: 1.5rem;
  }

  .blog-card__title {
    font-size: 1.2rem;
    font-weight: 700;
    color: $--color-primary;
    margin: 0 0 0.5rem 0;
    line-height: 1.3;
  }

  .blog-card__date {
    font-size: 0.875rem;
    color: $--color-gray-3;
    margin-bottom: 1rem;
  }

  .blog-card__perex {
    font-size: 0.9rem;
    line-height: 1.5;
    color: $--color-text-regular;
    margin: 0;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    overflow: hidden;
  }
</style>
