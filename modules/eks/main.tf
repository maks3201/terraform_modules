################################################################
##########               EKS CLUSTER           #################
################################################################

resource "aws_eks_cluster" "main" {
  name     = "${var.env}-cluster"
  role_arn = aws_iam_role.eks-iam-role.arn

  vpc_config {
    subnet_ids = aws_subnet.public_subnets.*.id
  }

  depends_on = [
    aws_iam_role.eks-iam-role,
  ]
}

################################################################
##########               NODE GROUP             ################
################################################################

resource "aws_eks_node_group" "worker-node-group" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "workernodes"
  node_role_arn   = aws_iam_role.workernodes.arn
  subnet_ids      = aws_subnet.public_subnets.*.id
  instance_types  = ["t3.medium"]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_subnet.public_subnets
  ]
}




