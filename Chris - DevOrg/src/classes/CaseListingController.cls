public class CaseListingController {

    List<DisplayCases> cases;
    //
    List<DisplayCases> newCases = new List<DisplayCases>();

// Action method to handle adding cases 
public PageReference addnewCase() {
    for(DisplayCases c : cases) {
        if(0 < c.qtyToBuy) {
            newCases.add(c);
        }
    }
    return null; // stay on the same page 
}

public String getCartContents() {
    if(0 == newCases.size()) {
        return '(empty)';
    }
    String msg = '<ul>\n';
    for(DisplayCases c : newCases) {
        msg += '<li>';
        msg += c.Subject + ' (' + c.qtyToBuy + ')';
        msg += '</li>\n';
    }
    msg += '</ul>';
    return msg;
}
    
    //
    public List<DisplayCases> getListofCases() {
        if(cases == null) {
            cases = new List<DisplayCases>();
            for(case item : [
                    SELECT CaseNumber, Subject, Status, Priority FROM case]) {
                cases.add(new DisplayCases(item));
            }
        }
        return cases;
    }
    
    // Inner class to hold case details for item
    public class DisplayCases {

        private Case c;
        public DisplayCases(Case item) {
            this.c = item;
        }

        // Properties for use in the Visualforce view
        public String casenumber {
            get { return c.casenumber; }
        }
        public String subject {
            get { return c.Subject; }
        }
        public String status {
            get { return c.Status; }
        }
        public String priority {
            get { return c.Priority; }
        }
        public Integer qtyToBuy { get; set; }
        
        public Boolean inStock {
            get { return True; }
        }
    }
}