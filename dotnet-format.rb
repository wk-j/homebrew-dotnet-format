class DotnetFormat < Formula
  desc "Format C# document using Roslyn"
  homepage "https://github.com/wk-j/dotnet-format"
  url "https://github.com/wk-j/dotnet-format/releases/download/0.3.0/dotnet-format.0.3.0.zip"
  version "0.3.0"
  sha256 "f21e72f5b2123996754d707b68b953078ecab61a0de455b88fd59ce672a17370"

  # depends_on "mono" => :recommended

  def install
    libexec.install Dir["*"]

    # To match non-mono install, create an `omnisharp' shell script.
    (bin/"dotnet-format").write <<-EOS.undent
      #!/usr/bin/env sh
      mono /usr/local/opt/dotnet-format/libexec/DotNetFormat.exe $@
    EOS
  end

  def post_install
    system "/bin/chmod +x #{bin}/dotnet-format"
  end

end