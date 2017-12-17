class DotnetFormat < Formula
  desc "Format C# document using Roslyn"
  homepage "https://github.com/wk-j/dotnet-format"
  url "https://github.com/wk-j/dotnet-format/releases/download/0.4.0/dotnet-format.0.4.0.zip"
  version "0.4.0"
  sha256 "d83282dc5f5cbe10e3bc6ea6bc164eb1f762060fbdb4168cc8daae95a3e09ce5"

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