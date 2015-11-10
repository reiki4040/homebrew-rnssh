require "formula"

class Rnssh < Formula
  desc "easy ssh login to EC2."
  homepage 'https://github.com/reiki4040/rnssh'
  version "0.3.5"

  if OS.mac?
    if Hardware.is_64_bit?
      url "https://github.com/reiki4040/rnssh/releases/download/v" + version + "/rnssh-" + version + "-darwin-amd64.zip"
      sha256 '7eee194af76e3727909ce483fc725eda3ba29460345648c89938ec04311cebd0'
    else
      url "https://github.com/reiki4040/rnssh/releases/download/v" + version + "/rnssh-" + version + "-darwin-386.zip"
      sha256 '58b3ee14e29291ba5ec632fdf2a9dffcc47553d346ec5f07cf8608c5917dcf7d'
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
