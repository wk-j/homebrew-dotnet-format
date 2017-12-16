class DotnetFormat < Formula
  desc "Format C# document using Roslyn"
  homepage "https://github.com/wk-j/dotnet-format"
  url "https://github.com/wk-j/dotnet-format/releases/download/0.2.0/dotnet-format.0.2.0.zip"
  version "0.2.0"
  sha256 "e7e48d68ccf3fcd6a316f901fb50c6a24ab74a27a4bcb7aa76b828f975bddf72"

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