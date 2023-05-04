class Project {
  int? id;
  String? name;
  String? identifier;
  String? description;
  int? status;
  bool? isPublic;
  bool? inheritMembers;
  String? createdOn;
  String? updatedOn;

  Project(
      {this.id,
      this.name,
      this.identifier,
      this.description,
      this.status,
      this.isPublic,
      this.inheritMembers,
      this.createdOn,
      this.updatedOn});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    identifier = json['identifier'];
    description = json['description'];
    status = json['status'];
    isPublic = json['is_public'];
    inheritMembers = json['inherit_members'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['identifier'] = this.identifier;
    data['description'] = this.description;
    data['status'] = this.status;
    data['is_public'] = this.isPublic;
    data['inherit_members'] = this.inheritMembers;
    data['created_on'] = this.createdOn;
    data['updated_on'] = this.updatedOn;
    return data;
  }
}
