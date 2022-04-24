class DetailApproval {
    DetailApproval({
        this.id,
        this.title,
        this.html,
        this.approval,
        this.recall,
    });

    int? id;
    String? title;
    String? html;
    ApprovalData? approval;
    Recall? recall;
}

class ApprovalData {
    ApprovalData({
        this.text,
        this.color,
        this.dialog,
    });

    String? text;
    String? color;
    ApprovalDialog? dialog;

 
}

class ApprovalDialog {
    ApprovalDialog({
        this.approve,
        this.reject,
    });

    ApproveClass? approve;
    ApproveClass? reject;

}

class ApproveClass {
    ApproveClass({
        this.text,
        this.color,
    });

    String? text;
    String? color;

    
}

class Recall {
    Recall({
        this.text,
        this.dialog,
    });

    String? text;
    ApproveClass? dialog;

}
