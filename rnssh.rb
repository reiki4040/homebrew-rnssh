class Rnssh < Formula
  desc "easy ssh login to EC2."
  homepage "https://github.com/reiki4040/rnssh"
  version "0.3.9"
  devel_version = "0.4.0"

  if OS.mac?
    url "https://github.com/reiki4040/rnssh/releases/download/v" + version + "/rnssh-" + version + "-darwin-amd64.zip"
    sha256 "f35a700ade64017806735f25576683c6ccf868805d6b97972ecb239e51372686"
  end

  devel do
    url "https://github.com/reiki4040/rnssh/releases/download/v" + devel_version + "/rnssh-" + devel_version + "-darwin-amd64.zip"
    sha256 "9c6a53c9b27bce196a7ac3a52c8b5cbabe12e88415df4a28412f508a834ed58a"
  end

  def install
    bin.install "rnssh"
  end

  # show message after installation.
  def caveats
    <<-EOF.undent
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

    # until v0.3.9
    rnssh --init

    # after v0.4.0
    rnssh -init

EOF
  end

  test do
    # nothing
  end
end
