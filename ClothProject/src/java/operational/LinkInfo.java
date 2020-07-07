package operational;

public class LinkInfo {

    private String linkText, linkPath, linkPage;

    public String getLinkText() {
        return linkText;
    }

    public void setLinkText(String linkText) {
        this.linkText = linkText;
    }

    public String getLinkPath() {
        return linkPath;
    }

    public void setLinkPath(String linkPath) {
        this.linkPath = linkPath;
    }

    public String getLinkPage() {
        return linkPage;
    }

    public void setLinkPage(String linkPage) {
        this.linkPage = linkPage;
    }

    public LinkInfo() {

    }

    public LinkInfo(String linkText, String linkPath, String linkPage) {
        super();
        this.linkText = linkText;
        this.linkPath = linkPath;
        this.linkPage = linkPage;
    }

}
