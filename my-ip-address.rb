class MyIpAddress < Formula
  desc "GitHub contributions"
  homepage "https://github.com/wk-j/my-ip-address"
  url "https://github.com/wk-j/my-ip-address/releases/download/0.1.0/my-ip-address.0.1.0.zip"
  version "0.2.0"
  sha256 "e22a641d5752ae2bcc086b81054779d7946b27fc9daf42fd70b6e19b3769e3f0"

  # depends_on "mono" => :recommended

  def install
    libexec.install Dir["*"]

    # To match non-mono install, create an `omnisharp' shell script.
    (bin/"my-ip-address").write <<-EOS.undent
      #!/usr/bin/env sh
      dotnet /usr/local/opt/my-ip-address/libexec/MyIpAddress.dll $@
    EOS
  end

  def post_install
    system "/bin/chmod +x #{bin}/my-ip-address"
  end

end
