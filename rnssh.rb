class Rnssh < Formula
  desc "Easy ssh login to EC2"
  homepage "https://github.com/reiki4040/rnssh"
  version "0.4.0"
  normal_sha256 = "9c6a53c9b27bce196a7ac3a52c8b5cbabe12e88415df4a28412f508a834ed58a"
  devel_version = "0.5.0-dev1"
  devel_sha256 = "5444d7309e5dae2f8a8a4497633441e9335027fb54c38a23fb16a706403c580c"

  if OS.mac?
    url "https://github.com/reiki4040/rnssh/releases/download/v" + version + "/rnssh-" + version + "-darwin-amd64.zip"
    sha256 normal_sha256
  end

  devel do
    url "https://github.com/reiki4040/rnssh/releases/download/" + devel_version + "/rnssh-" + devel_version + "-darwin-amd64.tar.gz"
    version devel_version
    sha256 devel_sha256
  end

  def install
    bin.install "rnssh"
  end

  # show message after installation.
  def caveats
    <<~EOS
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

    EOS
  end

  test do
    # nothing
  end
end
