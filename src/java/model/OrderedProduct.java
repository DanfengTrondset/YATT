package model;

public class OrderedProduct implements java.io.Serializable {

    private OrderedProductId id;
    private CustomerOrder customerOrder;
    private Product product;
    private int quantity;

    public OrderedProduct() {
    }

    public OrderedProduct(OrderedProductId id, CustomerOrder customerOrder, Product product, int quantity) {
        this.id = id;
        this.customerOrder = customerOrder;
        this.product = product;
        this.quantity = quantity;
    }

    public OrderedProductId getId() {
        return this.id;
    }

    public void setId(OrderedProductId id) {
        this.id = id;
    }

    public CustomerOrder getCustomerOrder() {
        return this.customerOrder;
    }

    public void setCustomerOrder(CustomerOrder customerOrder) {
        this.customerOrder = customerOrder;
    }

    public Product getProduct() {
        return this.product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return this.quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
