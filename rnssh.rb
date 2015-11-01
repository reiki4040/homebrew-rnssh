require "formula"

HOMEBREW_RNSSH_VERSION="0.3.0"

class Rnssh < Formula
  homepage 'https://github.com/reiki4040/rnssh'

  if OS.mac?
    if Hardware.is_64_bit?
      url "https://github.com/reiki4040/rnssh/releases/download/v#{HOMEBREW_RNSSH_VERSION}/rnssh-#{HOMEBREW_RNSSH_VERSION}-darwin-amd64.zip"
      sha1 'd8be9537aa2752947702e92091840ea4cf489ffd'
    else
      url "https://github.com/reiki4040/rnssh/releases/download/v#{HOMEBREW_RNSSH_VERSION}/rnssh-#{HOMEBREW_RNSSH_VERSION}-darwin-amd32.zip"
      sha1 'd0ca71cb48dc17c6322cb9de7933d7422c3d28df'
    end
  end

  version HOMEBREW_RNSSH_VERSION

  def install
    bin.install Dir['./rnssh']
  end

  # show message after installation.
  def caveats
    msg = <<-EOF.undent
    # rnssh need AWS access key for working.
    # Please set environment variable for AWS connection.
    # (~/.bashrc, ~/.zshrc or other.)

    export AWS_ACCESS_KEY_ID="YOUR AWS ACCESS KEY"
    export AWS_SECRET_ACCESS_KEY="YOUR AWS SECRET ACCESS KEY"

    # Option: you can set default aws region.

    export AWS_REGION="ap-northeast-1"

EOF
  end
end
