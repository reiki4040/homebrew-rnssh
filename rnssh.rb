require "formula"

class Rnssh < Formula
  desc "easy ssh login to EC2."
  homepage 'https://github.com/reiki4040/rnssh'
  version "0.3.7"

  if OS.mac?
    if Hardware.is_64_bit?
      url "https://github.com/reiki4040/rnssh/releases/download/v" + version + "/rnssh-" + version + "-darwin-amd64.zip"
      sha256 '913fe3634b4e68eecd1124ec0e13484e7e400f238c8e85ba666da11fa1bf819a'
    else
      url "https://github.com/reiki4040/rnssh/releases/download/v" + version + "/rnssh-" + version + "-darwin-386.zip"
      sha256 '1a3e5842dfc70db1df43790e6c998b8b14a1ab5645616bf553e447cd320940b7'
    end
  end


  def install
    bin.install 'rnssh'
  end

  # show message after installation.
  def caveats
    msg = <<-EOF.undent
    # rnssh need AWS access key for working.
    # Please set key/secret to AWS credentials (~/.aws/credentials)

    [default]
    aws_access_key_id=your_key_id
    aws_secret_access_key=your_secret

    # or environment variable for AWS connection.
    # (~/.bashrc, ~/.zshrc or other.)

    export AWS_ACCESS_KEY_ID=YOUR_AWS_ACCESS_KEY
    export AWS_SECRET_ACCESS_KEY=YOUR_AWS_SECRET_ACCESS_KEY

    # set default aws region.

    rnssh --init

EOF
  end
end
