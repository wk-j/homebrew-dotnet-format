class GithubContributions < Formula
  desc "GitHub contributions"
  homepage "https://github.com/wk-j/github-contributions"
  url "https://github.com/wk-j/github-contributions/releases/download/0.2.0/github-contributions.0.2.0.zip"
  version "0.2.0"
  sha256 "e22a641d5752ae2bcc086b81054779d7946b27fc9daf42fd70b6e19b3769e3f0"

  # depends_on "mono" => :recommended

  def install
    libexec.install Dir["*"]

    # To match non-mono install, create an `omnisharp' shell script.
    (bin/"github-contributions").write <<-EOS.undent
      #!/usr/bin/env sh
      dotnet /usr/local/opt/github-contributions/libexec/GitHubContributions.dll $@
    EOS
  end

  def post_install
    system "/bin/chmod +x #{bin}/github-contributions"
  end

end
