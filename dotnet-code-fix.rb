class DotnetCodeFix < Formula
  desc "Fix C# document using Roslyn"
  homepage "https://github.com/wk-j/dotnet-code-fix"
  url "https://github.com/wk-j/dotnet-code-fix/releases/download/0.1.0/dotnet-code-fix.0.1.0.zip"
  version "0.1.0"
  sha256 "b9b93b14b79d64c5cdfaf126cc9d2be7cfd2056f4c7a9d622aaacecac18919a5"

  # depends_on "mono" => :recommended

  def install
    libexec.install Dir["*"]

    # To match non-mono install, create an `omnisharp' shell script.
    (bin/"dotnet-format").write <<-EOS.undent
      #!/usr/bin/env sh
      dotnet /usr/local/opt/dotnet-code-fix/libexec/DotNetCodeFix.dll $@
    EOS
  end

  def post_install
    system "/bin/chmod +x #{bin}/dotnet-code-fix"
  end

end
