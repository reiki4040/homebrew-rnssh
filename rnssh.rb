require "formula"

class Rnssh < Formula
  desc "easy ssh login to EC2."
  homepage 'https://github.com/reiki4040/rnssh'
  version "0.3.8"

  if OS.mac?
    if Hardware.is_64_bit?
      url "https://github.com/reiki4040/rnssh/releases/download/v" + version + "/rnssh-" + version + "-darwin-amd64.zip"
      sha256 '2d7f8d10bc81b8865c1fb760382cfdfe7acc663eeb628c40fe95ec2fdae3d7a0'
    else
      url "https://github.com/reiki4040/rnssh/releases/download/v" + version + "/rnssh-" + version + "-darwin-386.zip"
      sha256 '95b1f84bfa4bb813535f136661de1817d4b05e5f9ba05525e0cebf6f4e07318a'
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
