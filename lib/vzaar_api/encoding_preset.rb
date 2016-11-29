module VzaarApi
  class EncodingPreset

    include Lib::HasCollectionBuilder
    include Lib::HasResourceUrl
    include Lib::ActiveObject::Find
    include Lib::WillPaginate

    ENDPOINT = 'encoding_presets'

    attr_reader :id, :name, :description, :output_format, :bitrate_kbps,
      :long_dimension, :video_codec, :profile, :frame_rate_upper_threshold,
      :keyframe_upper_threshold, :audio_bitrate_kbps, :audio_channels,
      :audio_sample_rate, :max_bitrate_kbps, :created_at, :updated_at

    def initialize(attrs = {})
      @id = attrs[:id]
      @name = attrs[:name]
      @description = attrs[:description]
      @output_format = attrs[:output_format]
      @bitrate_kbps = attrs[:bitrate_kbps]
      @max_bitrate_kbps = attrs[:max_bitrate_kbps]
      @long_dimension = attrs[:long_dimension]
      @video_codec = attrs[:video_codec]
      @profile = attrs[:profile]
      @frame_rate_upper_threshold = attrs[:frame_rate_upper_threshold]
      @keyframe_upper_threshold = attrs[:keyframe_upper_threshold]
      @audio_bitrate_kbps = attrs[:audio_bitrate_kbps]
      @audio_channels = attrs[:audio_channels]
      @audio_sample_rate = attrs[:audio_sample_rate]
      @created_at = attrs[:created_at]
      @updated_at = attrs[:updated_at]
    end

    def to_hash
      {
        id: self.id,
        name: self.name,
        description: self.description,
        output_format: self.output_format,
        bitrate_kbps: self.bitrate_kbps,
        max_bitrate_kbps: self.max_bitrate_kbps,
        long_dimension: self.long_dimension,
        video_codec: self.video_codec,
        profile: self.profile,
        frame_rate_upper_threshold: self.frame_rate_upper_threshold,
        keyframe_upper_threshold: self.keyframe_upper_threshold,
        audio_bitrate_kbps: self.audio_bitrate_kbps,
        audio_channels: self.audio_channels,
        audio_sample_rate: self.audio_sample_rate,
        created_at: self.created_at,
        updated_at: self.updated_at
      }
    end

  end
end
