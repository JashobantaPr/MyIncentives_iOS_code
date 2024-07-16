class UserTicket {
  int? srNo;
  String? ticketId;
  String? subject;
  String? ticketNumber;
  String? status;
  String? assignee;
  String? createdDate;
  String? action;

  UserTicket({
    this.srNo,
    this.ticketId,
    this.subject,
    this.ticketNumber,
    this.status,
    this.assignee,
    this.createdDate,
    this.action,
  });

  factory UserTicket.fromJson(Map<String, dynamic> json) {
    return UserTicket(
      srNo: json['sr_no'] ?? 0,
      ticketId: json['ticket_id'] ?? '',
      subject: json['subject'] ?? '',
      ticketNumber: json['ticket_number'] ?? '',
      status: json['status'] ?? '',
      assignee: json['assignee'] ?? '',
      createdDate: json['created_date'] ?? '',
      action: json['action'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sr_no': srNo,
      'ticket_id': ticketId,
      'subject': subject,
      'ticket_number': ticketNumber,
      'status': status,
      'assignee': assignee,
      'created_date': createdDate,
      'action': action,
    };
  }
}
