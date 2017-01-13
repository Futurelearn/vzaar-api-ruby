module VzaarApi
  class Video < Abstract

    ENDPOINT = 'videos'

    ATTR_READERS = [:id, :user_id, :account_id, :renditions,
                    :legacy_renditions, :url, :thumbnail_url,
                    :state, :created_at, :updated_at].freeze

    ATTR_ACCESSORS = [:description, :private, :seo_url, :title].freeze

    prepend Lib::HasAttributes
    include Lib::HasResourceUrl
    include Lib::ActiveObject::Find
    include Lib::ActiveObject::Save
    include Lib::ActiveObject::Delete
    include Lib::WillPaginate

    def initialize(attrs = {})
      update_from_attributes attrs
    end

    def self.create(attrs = {})
      Strategy::Video::Create.new(attrs, self).execute
    end

    private

    def update_from_attributes(attrs)
      @renditions = Rendition.build(attrs[:renditions])
      @legacy_renditions = LegacyRendition.build(attrs[:renditions])
    end

  end
end
