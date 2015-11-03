require "formula"

class Rnssh < Formula
  desc "easy ssh login to EC2."
  homepage 'https://github.com/reiki4040/rnssh'
  version "0.3.3"

  if OS.mac?
    if Hardware.is_64_bit?
      url "https://github.com/reiki4040/rnssh/releases/download/v" + version + "/rnssh-" + version + "-darwin-amd64.zip"
      sha256 'c2066f3f29cbd4946562fc533e1580ef40feadce5ec05928d25ce6f5fb07a416'
    else
      url "https://github.com/reiki4040/rnssh/releases/download/v" + version + "/rnssh-" + version + "-darwin-386.zip"
      sha256 '8cb529615d7eda0154924ef8bddf99858d0641856b9bd4fbd96f1a5b1e2f88a4'
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
