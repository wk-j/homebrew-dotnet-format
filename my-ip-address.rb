class MyIpAddress < Formula
  desc "GitHub contributions"
  homepage "https://github.com/wk-j/my-ip-address"
  url "https://github.com/wk-j/my-ip-address/releases/download/0.1.0/my-ip-address.0.1.0.zip"
  version "0.2.0"
  sha256 "5231892570d550e38a07639cd8f659e0a0da4e3aa58083d2587a7b33de19ddf7"

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
