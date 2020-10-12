package tpmbds

class SaleAd {
    String title
    String description
    String longDescription

    Date dateCreated
    Date lastUpdated

    Float price


    static hasMany = [illustrations: Illustration]
    static belongsTo = [author: User]

    static constraints = {
        title blank: false, nullable: false
        description blank: false, nullable: false
        longDescription blank: false, nullable: false
        illustrations nullable: true
        price min: 0F
    }
}
