require "bluesky/version"

class Bluesky
  def initialize(required_keys, config: "config file", manifest: "env key list")
    @keys = required_keys.map(&:to_s)
    @config = config
    @manifest = manifest
  end

  def cook(hash)
    valid = true
    valid &= no_missing_keys(hash)
    valid &= no_extra_keys(hash)
    valid || exit(1)
  end

  def no_missing_keys(hash)
    missing_keys = @keys - hash.keys.map(&:to_s)
    missing_keys.none? || puts(("#"*10) + "\n\n" +
                               "Missing key from #{@config}:" +
                               "\n  #{missing_keys.join("\n  ")}" +
                               "\n\n(Checked from #{@manifest})" +
                               "\n\n")
  end

  def no_extra_keys(hash)
    extra_keys = hash.keys.map(&:to_s) - @keys
    extra_keys.none? || puts(("#"*10) + "\n\n" +
                             "Extra key detected in #{@config}:" +
                             "\n  #{extra_keys.join("\n  ")}" +
                             "\n\nPlease add to #{@manifest}!" +
                             "\n\n")
  end
end
