require "formula"

class Rnssh < Formula
  desc "easy ssh login to EC2."
  homepage 'https://github.com/reiki4040/rnssh'
  version "0.3.6"

  if OS.mac?
    if Hardware.is_64_bit?
      url "https://github.com/reiki4040/rnssh/releases/download/v" + version + "/rnssh-" + version + "-darwin-amd64.zip"
      sha256 '8bd237c1ec36010028c12f1fe6a69bd33892600a06a0dcc27019fcd6025d8960'
    else
      url "https://github.com/reiki4040/rnssh/releases/download/v" + version + "/rnssh-" + version + "-darwin-386.zip"
      sha256 'e42c5734c95c12f87eb4fd73012c2e6fd0c21581b50e8463db05bd052529140c'
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

    # Option: you can set default aws region.

    export AWS_REGION=ap-northeast-1

EOF
  end
end
