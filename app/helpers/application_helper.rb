module ApplicationHelper
  def default_meta_tags
    {
      site: 'サウナのすゝめ',
      description: 'サウナの正しい入り方と、ととのうコツが学べる！',
      keywords: 'サウナのすゝめ, サウナ, サウナー, ととのう, 整う',
      canonical: request.original_url,
      icon: [
        { href: image_url('favicon.png') },
        { href: image_url('favicon.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' }
      ],
      og: {
        site_name: :site,
        title: :site,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('twitter_card.png'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary',
        site: '@_taaaaiki'
      }
    }
  end
end
